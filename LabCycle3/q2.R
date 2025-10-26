createGraph <- function(vertices){
  graph <- vector("list", length = vertices)
  names(graph) <- as.character(1:vertices)
  for (i in 1:vertices){
    graph[[i]] <- c()
  }
  return(graph)
}

addEdge <- function(graph, u, v){
  graph[[as.character(u)]] <- c(graph[[as.character(u)]], v)
  graph[[as.character(v)]] <- c(graph[[as.character(v)]], u)
  return(graph)
}

DFS <- function(graph, start){
  visited <- rep(FALSE, length(graph))
  result <- c()
  
  dfsHelper <- function(node){
    visited[node] <<- TRUE
    result <<- c(result, node)
    
    for (neighbor in graph[[as.character(node)]]){
      if(!visited[neighbor]){
        dfsHelper(neighbor)
      }
    }
  }
  
  dfsHelper(start)
  return(result)
}

g <- createGraph(5)

g <- addEdge(g, 1, 2)
g <- addEdge(g, 1, 3)
g <- addEdge(g, 2, 4)
g <- addEdge(g, 3, 5)

print("Adjacency list:")
print(g)

dfs_result <- DFS(g, 1)
print("DFS Traversal starting from vertex 1: ")
print(dfs_result)