import Cocoa


//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Sort Algorithm

// 1. Bubble Sort: a simple comparison-based algorithm that repeatedly swaps adjacent elements if they are in the wrong order.
// Time: O(n^2), Space:O(1)

//var bubbles:[Int]? = nil
var bubbles: [Int]? = [3,9,7,2,9,8,7,6,1,4,5]
func bubbleSort(_ arr: inout [Int]?) -> [Int]? {
    guard var arr = arr, arr.count > 0 else {
        return arr
    }
    
    for i in 0 ..< arr.count {
        for j in  i ..< arr.count {
            if (arr[i] > arr[j]) {
                // swap two element:
                // (1)Using Add/Minus operation
//                arr[i] = arr[i] + arr[j]
//                arr[j] = arr[i] - arr[j]
//                arr[i] = arr[i] - arr[j]
//                 (2)Using Exclusive Or Opertion
                arr[i] = arr[i] ^ arr[j]
                arr[j] = arr[i] ^ arr[j]
                arr[i] = arr[i] ^ arr[j]
                
//                // (3)Using temp varible
//                let t = arr[i]
//                arr[i] = arr[j]
//                arr[j] = t
                
            }
        }
    }
    return arr
}

bubbleSort(&bubbles)

// 2. Insertion Sort:Insertion sort is a simple sorting algorithm that works by sorting an array one element at a time. The algorithm builds the final sorted array by inserting each element in its proper position.
// Here are the steps of the insertion sort algorithm:
// Iterate through the array from the second element to the last element.
// For each element, compare it with the elements before it until you find the correct position to insert it.
// Shift the elements to the right to make room for the new element.
// Insert the new element in the correct position.

var insertNums = [4,9,1,3,8,7,2]
func insertSort(_ arr: inout [Int]) -> [Int] {
    guard arr.count > 0  else {
        return []
    }
    
    for i in 1 ..< arr.count {
//        var j = i
//        while j > 0 , arr[j - 1] > arr[j] {
//            let temp = arr[j - 1]
//            arr[j - 1] = arr[j]
//            arr[j] = temp
//            j -= 1
//        }
//
        // It is used to shift the elements to the right to make room for the new element. This loop condition is effective in this context because it checks if the previous element is greater than the new element, which indicates that the previous element needs to be moved one position to the right to make room for the new element.
        let cur = arr[i]
        var j = i - 1
        while j >= 0, arr[j] > cur { // For each element, compare it with the elements before it until you find the correct position to insert it.

            arr[j + 1] = arr[j] // Shift the elements to the right to make room for the new element
            j -= 1
        }
        arr[j + 1] = cur // Insert the new element in the correct position.
    }
    return arr
}
insertSort(&insertNums)

/*
 3. Selection Sort:Selection sort is a simple sorting algorithm that works by repeatedly finding the minimum element from the unsorted part of an array and putting it at the beginning of the sorted part of the array.
Here are the steps of the selection sort algorithm:

Find the minimum element in the unsorted part of the array.
Swap the minimum element with the first element of the unsorted part of the array.
Move the boundary of the sorted part of the array one position to the right.
Repeat steps 1-3 until the entire array is sorted.
*/

var selNums = [8,3,4,7,9,2,1]
var selStrs = ["z","ab", "cd","3"]
func selectionSort<T: Comparable> (_ arr: inout [T])  {
    for i in 0 ..< arr.count {
        
        var j = i + 1
        var minIndex = i
        while j < arr.count {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
            j += 1
        }
//
//        arr[i] = arr[i] + arr[minIndex]
//        arr[minIndex] = arr[i] - arr[minIndex] // Binary operator '-' cannot be applied to two 'T' operands
//        arr[i] = arr[i] - arr[minIndex]
        let temp = arr[minIndex]
        arr[minIndex] = arr[i]
        arr[i] = temp // arr.swapAt(i,minIndex)
        
    }
}
selectionSort(&selNums)
// 4. Merge Sort is a popular sorting algorithm that uses the divide-and-conquer approach to sort a list or an array of elements. It works by dividing the input list into two halves, sorting each half separately, and then merging the sorted halves back together.
// Here is a step-by-step explanation of how Merge Sort works:
// Divide the unsorted list into n sublists, each containing one element (a list of one element is considered sorted).
// Repeatedly merge sublists to produce new sorted sublists until there is only one sublist remaining. This will be the sorted list.
func mergeSort(_ arr: inout [Int]) {
    if arr.isEmpty {
        return
    }
    
    
    
}

// 5: Quick Sort: a divide-and-conquer algorithm that chooses a pivot element, partitions the array around the pivot, and recursively sorts the partitions.
/*
 *
 快速排序（QuickSort）是一种常见的排序算法，它使用分治法（Divide and conquer）的思想将一个大问题划分成若干个小问题来解决，其基本思路如下：

 选取一个基准元素（pivot），将待排序序列分成两部分，左边部分的元素都小于等于基准元素，右边部分的元素都大于等于基准元素；
 对左右两个子序列分别递归地进行快速排序，直到子序列的长度为1或0。
 快速排序的核心操作是分区（Partition）操作，即将待排序序列按照基准元素进行划分。一般来说，分区操作有两种实现方式：

 Lomuto分区（Lomuto Partition Scheme）：从左向右扫描待排序序列，将小于等于基准元素的元素放在左边，大于基准元素的元素放在右边，最后将基准元素放在中间位置；
 Hoare分区（Hoare Partition Scheme）：从序列的两端分别向中间扫描，将小于等于基准元素的元素与大于等于基准元素的元素进行交换，直到两个扫描指针相遇，最后将基准元素插入到中间位置。
 Lomuto分区是较为简单的分区方式，但是对于存在大量相等元素的序列，它可能会导致分区不均衡，影响排序的效率。Hoare分区相对来说更加高效，但是实现较为复杂。

 快速排序的时间复杂度为O(nlogn)，但是在最坏情况下，即每次分区都只能将待排序序列划分成一个元素和剩余元素两部分时，时间复杂度会退化为O(n^2)，这种情况通常可以通过随机选择基准元素来避免。
 */

var nums:[Int]? = [3,2,1,9,8,7,3,4]
func quickSort(_ arr: inout [Int]?) -> [Int]? {
    guard var arr = arr, arr.count > 0 else {
        return nil
    }
    partation(&arr, left: 0, right: arr.count - 1)
    return arr
}

func partation(_ arr: inout [Int],left:Int, right:Int)  {
    guard left < right else {
        return
    }
    
    let pivotV = arr[right]
    var low = left
    for high in left ..< right {
        if arr[high] <= pivotV {
            arr.swapAt(low, high)
            low += 1
        }
    }
    arr.swapAt(low, right)
    
    partation(&arr, left: left, right: low - 1)
    partation(&arr, left: low + 1, right: right)
}
quickSort(&nums)


var str = "Hello"
str.prefix(0)
str.prefix(2)
str.hasPrefix("Hello")


// 6: Heap Sort:

// 7: Radi Sort:

