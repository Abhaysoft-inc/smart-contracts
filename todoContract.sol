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

   





}