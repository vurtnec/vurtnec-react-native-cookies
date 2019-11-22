## @aaxis/react-native-cookies

Cookie manager for react native, this is fork from react-native-cookies and did AndroidX support & some bug fixes.

### Installation

```
yarn add react-native-cookies
```

### Linking

#### Automatic (recommended)

```
react-native link react-native-cookies
```

#### Manual

If automatic linking does not work, you can manually link this library by following the instructions below:

##### iOS

1. Open your project in Xcode, right click on `Libraries` and click `Add
   Files to "Your Project Name"` Look under `node_modules/react-native-cookies/ios` and add `RNCookieManagerIOS.xcodeproj`.
2. Add `libRNCookieManagerIOS.a` to `Build Phases -> Link Binary With Libraries.
3. Clean and rebuild your project

##### Android

Run `react-native link` to link the react-native-cookies library.

Or if you have trouble, make the following additions to the given files manually:

**android/settings.gradle**

```gradle
include ':react-native-cookies'
project(':react-native-cookies').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-cookies/android')
```

**android/app/build.gradle**

```gradle
dependencies {
   ...
   compile project(':react-native-cookies')
}
```

**MainApplication.java**

On top, where imports are:

```java
import com.aaxis.cookiemanager.CookieManagerPackage;
```

Add the `CookieManagerPackage` class to your list of exported packages.

```java
@Override
protected List<ReactPackage> getPackages() {
    return Arrays.asList(
            new MainReactPackage(),
            new CookieManagerPackage()
    );
}
```


### Usage

```javascript
import CookieManager from 'react-native-cookies';

// Set cookies 
CookieManager.set(
{
  domain: dm,
  name: key,
  value: value.value,
  origin: domain,
  path: '/',
  version: '1',
  expiration: '2035-05-30T12:30:00.00-05:00',
},
useWebKit
).then(() => {
console.log(
  `set cookie to ${domain} of key: ${key}, value: ${value.value} success.`
)
if (callback) callback()
})

// Get cookies 
CookieManager.get(domain, useWebKit).then(res => {
    console.log(`get cookie from ${domain} => ${JSON.stringify(res)}`)
})

// list cookies
CookieManager.getAll().then(res => {
    console.log(`get all cookies from => ${JSON.stringify(res)}`)
})

// clear cookies
CookieManager.clearAll(useWebKit)
  .then((res) => {
    console.log('CookieManager.clearAll =>', res);
  });

```

### TODO

- Proper `getAll` dictionary by domain
- Proper error handling
- Anything else?

PR's welcome!
