# weather_app

A new Flutter project.

## Getting Started

====================================================================================================
## Longest common sequence with optimized order of complexity

import kotlinx.coroutines.*
import kotlin.system.measureTimeMillis

fun main(){
val X = "AGGTAB"
val Y = "GXTXAYB"
val result = longestCommonSubsequence(X, Y)
println("Longest Common Subsequence: $result")
}

fun longestCommonSubsequence(X: String, Y: String): String {
val m = X.length
val n = Y.length

    // Initialize a table to store the length of LCS for each subproblem.
    // lcsTable[i][j] will store the LCS length of X[0..i-1] and Y[0..j-1].
    val lcsTable = Array(m + 1) { IntArray(n + 1) }

    // Fill the lcsTable using dynamic programming.
    for (i in 1..m) {
        for (j in 1..n) {
            if (X[i - 1] == Y[j - 1]) {
                lcsTable[i][j] = lcsTable[i - 1][j - 1] + 1
            } else {
                lcsTable[i][j] = maxOf(lcsTable[i - 1][j], lcsTable[i][j - 1])
            }
        }
    }

    // Reconstruct the LCS itself by backtracking through the lcsTable.
    val lcs = StringBuilder()
    var i = m
    var j = n
    while (i > 0 && j > 0) {
        if (X[i - 1] == Y[j - 1]) {
            lcs.insert(0, X[i - 1])
            i--
            j--
        } else if (lcsTable[i - 1][j] > lcsTable[i][j - 1]) {
            i--
        } else {
            j--
        }
    }

    return lcs.toString()
}

====================================================================================================
## Implementing queues using stacks

import java.util.*

class QueueWithStacks<T> {
private val stack1 = Stack<T>()
private val stack2 = Stack<T>()

    fun isEmpty(): Boolean {
        return stack1.isEmpty() && stack2.isEmpty()
    }

    fun size(): Int {
        return stack1.size + stack2.size
    }

    fun enqueue(item: T) {
        stack1.push(item)
    }

    private fun transferStack1ToStack2() {
        while (stack1.isNotEmpty()) {
            stack2.push(stack1.pop())
        }
    }

    fun dequeue(): T? {
        if (isEmpty()) {
            return null // Queue is empty
        }

        if (stack2.isEmpty()) {
            transferStack1ToStack2()
        }

        return stack2.pop()
    }
}

fun main() {
val queue = QueueWithStacks<Int>()

    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)

    println("Queue size: ${queue.size()}") // Should print 3

    println("Dequeue: ${queue.dequeue()}") // Should print 1
    println("Dequeue: ${queue.dequeue()}") // Should print 2

    queue.enqueue(4)
    queue.enqueue(5)

    println("Queue size: ${queue.size()}") // Should print 3

    println("Dequeue: ${queue.dequeue()}") // Should print 3
    println("Dequeue: ${queue.dequeue()}") // Should print 4
    println("Dequeue: ${queue.dequeue()}") // Should print 5

    println("Queue size: ${queue.size()}") // Should print 0
}

