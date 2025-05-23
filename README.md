The app is ready to publish both Appstore and Playstore.

Note: As I was instructed to use mockapi.io as backend, I could not able to create more that 2 apis. Because in free plan of mockapi.io they allow users to create only 2 endpoints. So I had to make only 2 apis.

1. Login
2. Vehicles List

Both of them are get apis. As I could not create POST apis, I had to use get api to create the vibe of actual api calling. 

As usual the vehicle list is a list of data. 

I used these 2 api to create a vibe of actual app. 


Here is the link of more details of the app, like demo video, build apk, key.properties file and upload-keystore.jks

https://drive.google.com/drive/folders/1-mmhJznrFSnEddG53pO7ZMEGc_dZW2Mg?usp=sharing


🚀 Features

🔐 Login & Registration (with validation)

🚘 Browse and view available vehicles

📍 View vehicle details and location on Google Maps

👤 Profile



🛠️ Tech Stack

Flutter:	Frontend cross-platform framework

Dart:	Programming language

REST API:	Mock Api



📦 Packages Used

http: (to get data from api)

provider: (for state management)

shared_preferences: (to store user data to keep the session)

another_flushbar: (to show error messages)

flutter_spinkit: (used to show a loader)

flutter_map: (to show the current location  of the vehicle)

url_launcher: (to show the current location with google map)

cached_network_image: (to cache the images to )



📦 Installation

git clone https://github.com/Shishir335/rent_a_car.git

cd rent_a_car

flutter pub get

flutter run



🧪 Folder Structure


lib/
├── apiService/

├── controllers/

├── models/

├── presentation/

├── utils/

├── widgets/

└── main.dart

└── routes.dart



🧑‍💻 Developer

A. K. M. Mahbub Ullah

📧 mahbubshishir973@gmail.com

🔗 LinkedIn | https://www.linkedin.com/in/mahbub-ullah-2056471ba/



🤝 Contributing
Pull requests are welcome! For major changes, open an issue first to discuss what you would like to change.