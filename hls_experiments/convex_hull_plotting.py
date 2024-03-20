import numpy as np
from matplotlib import patches


def arc_patch(center, radius, theta1, theta2, resolution=16, **kwargs):
    theta = np.linspace(np.radians(theta1), np.radians(theta2), resolution)
    points = np.vstack(
        (radius * np.cos(theta) + center[0], radius * np.sin(theta) + center[1])
    )
    poly = patches.Polygon(points.T, closed=True, **kwargs)
    return poly


def draw_rounded_hull(
    x,
    hull,
    ax,
    padding=1.0,
    line_kwargs=None,
    fill_kwargs=None,
):
    default_line_kwargs = dict(color="black", linewidth=1)
    if line_kwargs is None:
        line_kwargs = default_line_kwargs
    else:
        line_kwargs = {**default_line_kwargs, **line_kwargs}

    default_fill_kwargs = dict(alpha=0.2)
    if fill_kwargs is None:
        fill_kwargs = default_fill_kwargs
    else:
        fill_kwargs = {**default_fill_kwargs, **fill_kwargs}

    hull_points = x[hull.vertices]
    hull_points = np.concatenate([hull_points[[-1]], hull_points, hull_points[[0]]])

    arcs = []
    arc_fills = []
    lines = []
    padded_points = []

    diameter = padding * 2
    for i in range(1, hull_points.shape[0] - 1):
        # line
        # source: https://stackoverflow.com/a/1243676/991496

        norm_next = np.flip(hull_points[i] - hull_points[i + 1]) * [-1, 1]
        norm_next /= np.linalg.norm(norm_next)

        norm_prev = np.flip(hull_points[i - 1] - hull_points[i]) * [-1, 1]
        norm_prev /= np.linalg.norm(norm_prev)

        # plot line
        line = hull_points[i : i + 2] + norm_next * diameter / 2
        lines.append(line)
        # ax.plot(line[:, 0], line[:, 1], **line_kwargs)

        padded_points.append(line[0])
        padded_points.append(line[1])

        # arc
        angle_next = np.rad2deg(np.arccos(np.dot(norm_next, [1, 0])))
        if norm_next[1] < 0:
            angle_next = 360 - angle_next

        angle_prev = np.rad2deg(np.arccos(np.dot(norm_prev, [1, 0])))
        if norm_prev[1] < 0:
            angle_prev = 360 - angle_prev

        print(angle_prev, angle_next)

        arc = patches.Arc(
            hull_points[i],
            diameter,
            diameter,
            angle=0,
            theta1=angle_prev,
            theta2=angle_next,
            **line_kwargs,
        )
        arcs.append(arc)

        theta_0 = angle_prev
        theta_1 = angle_next
        if theta_1 < theta_0:
            theta_1 += 360

        thetas = np.linspace(theta_0, theta_1, 16)
        points = np.vstack(
            (
                diameter / 2 * np.cos(np.radians(thetas)) + hull_points[i, 0],
                diameter / 2 * np.sin(np.radians(thetas)) + hull_points[i, 1],
            )
        )
        arc_fill = patches.Polygon(points.T, closed=True, **fill_kwargs, linewidth=0)
        arc_fills.append(arc_fill)

    padded_points = np.array(padded_points)
    polygon = patches.Polygon(padded_points, closed=True, **fill_kwargs, linewidth=0)
    ax.add_patch(polygon)
    for arc_fill in arc_fills:
        ax.add_patch(arc_fill)
    for line in lines:
        ax.plot(line[:, 0], line[:, 1], **line_kwargs)
    for arc in arcs:
        ax.add_patch(arc)
