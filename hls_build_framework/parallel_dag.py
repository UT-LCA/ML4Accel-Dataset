from concurrent.futures import Executor, Future

import networkx as nx

from hls_build_framework.framework import Design, DesignDataset, Frontend, ToolFlow


class HLSDatasetBuildDAG:
    def __init__(self, executor: Executor):
        self.executor = executor
        self.dag = nx.DiGraph()

        # 3 kinds of nodes in the DAG:
        # design nodes
        # dataset node
        # task nodes
        # sync nodes

        # design nodes specify source designs and are Design objects
        # task nodes specify tasks to be executed and are FrontEnd or ToolFlow objetcs that have a `def execute(self, design: Design) -> list[Design]` function
        # sync nodes specify synchronization points in the DAG for the concudrent futures executor

    def add_node_design(self, identifier: str, design: Design):
        self.dag.add_node(identifier, type="design", design=design)

    def add_node_dataset(self, identifier: str, dataset: DesignDataset):
        self.dag.add_node(identifier, type="dataset", dataset=dataset)

    def add_node_task(self, identifier: str, task: Frontend | ToolFlow):
        self.dag.add_node(identifier, type="task", task=task)

    def add_node_sync(self, identifier: str):
        self.dag.add_node(identifier, type="sync")

    def add_edge(self, source: str, target: str):
        # design and dataset nodes cannot have incoming edges
        if self.dag.nodes[source]["type"] in {"design", "dataset"}:
            raise ValueError(f"Node {source} cannot have incoming edges")
        self.dag.add_edge(source, target)

    def execute(self):
        visited: set[str] = set()
        to_visit = [
            node
            for node in nx.topological_sort(self.dag)
            if self.dag.in_degree(node) == 0
        ]
        futures: dict[str, Future] = {}

        while to_visit:
            node = to_visit.pop(0)
            node_data = self.dag.nodes[node]
            node_type = node_data["type"]

            match node_type:
                case "design":
                    ...
                case "dataset":
                    ...
                case "task":
                    ...
                case "sync":
                    ...


#               other_dataset -\
# polybench_dataset -> FrontEnd -> Tool

# from concurrent.futures import Future
# from collections.abc import Callable
# from typing import TypeVar
# T = TypeVar('T')
# U = TypeVar('U')
# def map_future(mapper: Callable[U, [T]], future: Future[list[T]]) -> Future[list[U]]:

# map_future(
#     toolflow_vitis_hls_impl.execute,
#     map_future(
#         toolflow_vitis_hls_synth.execute,
#         frontend.execute(abstract_design)
#     ))
