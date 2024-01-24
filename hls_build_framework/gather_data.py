import argparse
import csv
import json
from enum import Enum
from pathlib import Path


def main(args):
    file_format = args.format
    search_dir = args.search_dir
    output_file = args.output_file

    data_design_fps = list(search_dir.rglob("**/data_design.json"))
    data_designs = [json.loads(fp.read_text()) for fp in data_design_fps]

    design_dirs = [fp.parent for fp in data_design_fps]
    data_hls_fps = [design_dir / "data_hls.json" for design_dir in design_dirs]
    data_hls = [json.loads(fp.read_text()) for fp in data_hls_fps]

    data = []
    for data_design, data_hls in zip(data_designs, data_hls):
        data.append({**data_design, **data_hls})

    if file_format == FileFormat.CSV:
        with output_file.open("w") as f:
            writer = csv.DictWriter(f, fieldnames=data[0].keys())
            writer.writeheader()
            writer.writerows(data)

    if file_format == FileFormat.JSON:
        output_file.write_text(json.dumps(data, indent=4))


class FileFormat(Enum):
    CSV = "csv"
    JSON = "json"


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-f",
        "--format",
        type=FileFormat,
        choices=list(FileFormat),
        default=FileFormat.JSON,
        help="Output file format",
    )

    parser.add_argument(
        "search_dir", type=Path, help="Directory to search for generated HLS data"
    )
    parser.add_argument(
        "output_file", type=Path, help="Output file to write the aggregated data to"
    )
    args = parser.parse_args()

    main(args)
