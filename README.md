# Facet STL Viewer

A simple Android app to look at STL files (the 3D files used for 3D printing and CNC).

## What it does

- **Open STL** button, or tap an STL in your file manager and choose **Open with Facet**, or **Share** an STL to Facet from WhatsApp, Drive or email.
- Opens both kinds of STL file (binary and ASCII), even large ones.
- One finger turns the model, two fingers zoom and slide.
- **Fit** brings the whole model back into view. **Views** jumps to Top, Front, Right or 3D.
- **Wire** shows the triangle mesh. **Measure**: tap two points to see the distance, with X, Y and Z parts.
- **Info** shows size, volume, surface area, triangle count, file size, and an estimated weight if printed solid in PLA.
- **Settings** (top-right): model colour, Z-up or Y-up, slow spin, background, floor grid, axis arrows, and mm or inch. Settings are remembered.
- Works fully offline. Needs Android 7.0 or newer.

## Getting the APK (the installable app file)

You only need to do **one** of these.

### Way 1: GitHub builds it for you (free, nothing to install)

GitHub is a website that stores code. It can also run Google's official Android tools for you and hand back the finished APK.

1. Make a free account at github.com and sign in.
2. Click **+** (top right) → **New repository**. Name it `facet`, choose **Private**, click **Create repository**.
3. On the next page click **uploading an existing file**. Unzip this folder on your laptop, open it, select **everything inside** (including the `.github` folder) and drag it onto the page. Click **Commit changes**.
4. Open the **Actions** tab. A job called **Build APK** starts by itself. Wait about 3–5 minutes for the green tick.
5. Click the finished job, scroll down to **Artifacts**, and download **Facet-APK**. It downloads as a .zip; unzip it to get `app-debug.apk`.
6. Copy `app-debug.apk` to your phone and tap it. Android will ask you to allow installing apps from that source; allow it and tap **Install**.

If the Actions tab shows nothing, the `.github` folder did not upload (Windows sometimes hides folders starting with a dot). In GitHub click **Add file → Create new file**, type the name `.github/workflows/build-apk.yml`, paste in the contents of that file from this folder, and click **Commit**.

### Way 2: Android Studio on your laptop

Android Studio is Google's free app for building Android apps.

1. Install Android Studio from developer.android.com/studio.
2. **File → Open** and choose this folder. Wait for the bottom bar to finish ("Gradle sync"). The first time it downloads a lot, so give it 10–20 minutes.
3. **Build → Build App Bundle(s) / APK(s) → Build APK(s)**. When it finishes, click **locate** in the pop-up. The file is `app/build/outputs/apk/debug/app-debug.apk`.

## Changing things later

- **The look and the tools** live in one file: `web/index.html`. After editing it, run `python3 tools/build_web.py` (GitHub does this step for you automatically).
- **App name** on the home screen: `app/src/main/res/values/strings.xml`.
- **App icon**: `app/src/main/res/drawable/ic_launcher_foreground.xml` and the `mipmap-*` folders.
- **Version number**: `versionCode` and `versionName` in `app/build.gradle`. Raise `versionCode` by 1 each time so your phone treats the new APK as an update.

Every build is signed with the same key (`app/facet-debug.keystore`), so a new APK installs over the old one without uninstalling. Keep the repository private, because that key is in it.

## Folder map

```
web/index.html          the viewer screen, tools and settings (edit this)
web/lib, web/fonts      3D library (three.js, MIT licence) and fonts (Open Font Licence)
app/src/main/...        the Android wrapper around the viewer
tools/build_web.py      copies the viewer into the Android app
.github/workflows/      instructions GitHub follows to build the APK
```
