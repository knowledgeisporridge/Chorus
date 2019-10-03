# Chorus
#### A preteniously named code test.

Written to tackle the following challenge:
*"Produce a program which, when given the name of an artist, will produce the average number of words in their songs."*

### Running Instructions
This is a standard Xcode project and uses no third party frameworks, cocoapods or dependencies. To run you'll need a Mac running the latest version of MacOS and up-to-date Xcode tooling. This has been tested on Catalina and iOS13.

### Stretch Goal
As this is a test for developing iOS applications I figured my stretch goal would be to implement a basic iOS UI, using MVVM+C.

### Getting Around The Project

In Xcode's project navigator you'll find the following under the Chorus group;

 - Model; _The core domain model of the app, representing things like Albums, artists, etc_
 - Repositories; _The mechanisms of getting artists, albums and lyrics_
   - Artist; _The Artist Repository and WebService calls._
   - Lyrics; _The Lyrics Repository and WebService calls._
 - Screens; _Everything to do with presenting and displaying data_
 - Utilities; _A few simple extensions to String to simplify the code_
 - Application Main; _AppDelegate, Localisation... standard iOS app stuff_
 
A note about screens. This is an MVVM+C based app. You'll find ViewModel objects that understand the domain and wider services, and view controllers that understand view models. There are two coordinators; Root and Artist.

To review how webservice interactions work take a look under Repositories.
To review how the wider UI and app work, take a look under Screens.

### And Lastly...

If this were real, there would be a few other frameworks pulled in (Alamofire, RxSwift) to simplify a few things. But as it is I think it's a good example of how an MVVM+C iOS fits together, fetchs and processes data and updates the user.

