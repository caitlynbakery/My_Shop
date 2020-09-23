# Http Request

* Storing Data & Http
* Sending Http Requests(Store & Fetch Data)
* Show Loading Progress
* Handling Errors

## Storing Data & Http

Why do you wnawt to store things?
What are the two options for storing?
What are the advantages of each technique?
What are we focused on?

You want to store things so that it is saved when you refresh or restart your application. The two options for storing are
on-device storage and web storage. 

On-device storage is useful for offline applications and storing data on a single device. The data persists across
app restarts, but it is ONLY available to one user. 

Web storage stores data across different devices, so that many users can access your application. Web storage requries internet
connection and data persists across app restarts.



## Web storage with Firebase
HOw is server related to Firebase and why are we using it?
What is Firebase?

## Send Http Request
how to send request...

## Futures
There are two different ways to run async code in a Future.

1. Await and Async
2. .then() and catchError()

You should use await when handling http requests and when data is passed around web servers. 

## Error handling
You can use the try and catch features of Dart to handle sections of code that are more 'prone' to errors. For example, when dealing
with Http requests there is more oppurtunity for an error because the user could have poor internet connection or input invalid information. 

![error image](images/error.png)