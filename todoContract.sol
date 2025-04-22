// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract TodoContract {

    struct Task{
        string taskName;
        bool isCompleted;
    }

    Task[] public tasks;

    function addTask(string memory _taskName, bool _isCompleted) public{
        Task memory newTask = Task({
            taskName:_taskName,
            isCompleted:_isCompleted});
            tasks.push(newTask);
    }

    function getAllTasks() public  view  returns (Task[] memory){
        return tasks;
    }

    function updateTask(uint _index, string memory _updatedTaskName, bool _updatedIsCompleted) public {
        require(_index < tasks.length, "Invalid Task Index"); // this means the task doesnot exists
        tasks[_index].taskName = _updatedTaskName;
        tasks[_index].isCompleted = _updatedIsCompleted;
    } // this function is gonna update both the name and the status of the task

    // if we want to toggle the status of isCompleted of the task then we can use this function

    function toogleStatus (uint _index) public {
    tasks[_index].isCompleted = !tasks[_index].isCompleted;
    } 

   





}