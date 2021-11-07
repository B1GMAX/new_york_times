This application contains 3 screens: 
1)List of available categories.
2)List of articles loaded for the chosen category.
3)The article content in WebView.

The project has Bloc pattern for state management (UI receives data via dart Streams when data is loaded).
Provider library creates and disposes Bloc class and injects its instances for StreamBuilder widgets to access data streams.

Used libraries:
- http: to get data from nytimes.com.
- provider: not for state management, but for Bloc class create/dispose/inject.
- webview_flutter: to show article content.