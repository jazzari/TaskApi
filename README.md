# README

## TaskApi
Api to create task with a title, description and completed (boolean) fields. 

### Rails version
Ruby version 3.1.3
Rails version 7.0.8
Database: SQLite 

### Run test
To run tests run: **bundle exec rpsec**

### To try the endpoints
To try the endpoints first populate the database:
**rails db:seed**

Start the server:
**rails server**

To list all task in Postman use:
**GET http://localhost:3000/tasks**

To show a particular task in Postman use:
**GET http://localhost:3000/tasks/2**

To create a task in Postman use:
**POST http://localhost:3000/tasks**
and in Body/raw complete with:
{"task": {
    "title": "Nueva tarea 5",
    "description": "Realizar una nueva tarea 5",
    "completed": false
    }
}

To update a task in Postman use:
**PUT http://localhost:3000/tasks/2**
and in Body/raw complete with:
{"task": 
    {"completed": true }
}

To delete a particular task in Postman use:
**DELETE http://localhost:3000/tasks/2**


