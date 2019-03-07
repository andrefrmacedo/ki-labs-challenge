# Guide

## Pre Requesites
- `Docker 18.06.0+`

## Run the project
To run the project, first we need to build the docker image by running:
- `docker-compose build`

After that we need to setup the database with:
- `docker-compose run api rails db:setup`

This will set the database up and populate it with seeds.
To finally run this project, please enter the following command:
- `docker-compose-up`

## Run the tests
To run tests please enter the following command:
- `docker-compose run api rspec`

## Data Model
The data model consists basically of 2 main models, `Person` and `Slot`, with a many-to-many relationship. Thus creating the intermediate model `PersonSlot`

- `Person` has a `name` and a `role`
- `Slot` has a `date_time`
- `PersonSlot` has a `person_id`, `slot_id` and an `open` boolean field

## API Endpoint
The be able to retrieve the collection of slots when it's possible to arrange an interview for a particular candidate, the following endpoint was created:

| Endpoint                                                                 | Method | Response               |
| ------------------------------------------------------------------------ | ------ | ---------------------- |
| `http://localhost:3000/api/candidate/:id/available?interviewer_ids[]=id` | `GET`  | List possible slots    |

where `:id`is the candidate id and the interviewer ids go as an array of parameters in `interviewer_ids[]=id`

## Next Possible Steps
The next steps would envolve:
- Create another API endpoint to dynamically create more slots for interviewers and cadidates
- Create another API endpoint where an interview would be schedulled using the available slots (and creating a model `Interview`)
