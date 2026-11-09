# Facet STL Viewer

A simple app for Android and Windows to look at STL files (the 3D files used for 3D printing and CNC).

## What it does

- **Open STL** button, or tap an STL in your file manager and choose **Open with Facet**, or **Share** an STL to Facet from WhatsApp, Drive or email.
- Opens both kinds of STL file (binary and ASCII), even large ones.
- One finger turns the model, two fingers zoom and slide.
- **Fit** brings the whole model back into view. **Views** jumps to Top, Front, Right or 3D.
- **Wire** shows the triangle mesh. **Measure**: tap two points to see the distance, with X, Y and Z parts.
- **Info** shows size, volume, surface area, triangle count, file size, and an estimated weight if printed solid in PLA.
- **Settings** (top-right): model colour, Z-up or Y-up, slow spin, background, floor grid, axis arrows, and mm or inch. Settings are remembered.
- Made for phones and tablets, upright or sideways. On tablets and sideways phones, Info and Settings open as side panels so the model stays visible.
- Works fully offline. Needs Android 7.0 or newer.

## Getting the apps

Every time code in this repository changes, GitHub builds the Android app and the Windows app by itself. This takes about 5–8 minutes.

1. Open the **Releases** page of this repository (right side of the main page, or `/releases`).
2. Under the newest **Facet 1.0.N**, download the file for your device:
   - **Android phone or tablet:** `Facet-Android-1.0.N.apk`. Open it on the device; Android will ask to allow installing apps from that source; allow it and tap **Install**.
   - **Windows, installed:** `Facet-Windows-Setup-1.0.N.exe`. Run it and follow the steps. It adds Facet to the Start menu and desktop, and to **Open with** (right-click a file in File Explorer) for .stl files. Your current default program for those files is not changed.
   - **Windows, no install:** `Facet-Windows-Portable-1.0.N.exe`. Double-click to run from any folder or USB stick. It starts a little slower because it unpacks itself each time.

Windows may show a blue **"Windows protected your PC"** box the first time, because the app isn't signed with a paid certificate. Click **More info → Run anyway**.

On Windows: **Ctrl+O** opens a file, **F11** is full screen, **Esc** closes panels, and you can drag a file onto the window.

To build again without changing anything: **Actions** tab → **Build apps** → **Run workflow**.

The Android app's signing key is kept out of this repository. It is stored as a private GitHub secret named `FACET_KEYSTORE` (Settings → Secrets and variables → Actions). With it, every build is signed the same way, so a new APK installs over the old one as an update.

### Optional: build the Android app yourself with Android Studio

Android Studio is Google's free app for building Android apps.

1. Install Android Studio from developer.android.com/studio.
2. **File → Open** and choose this folder. Wait for the bottom bar to finish ("Gradle sync"). The first time it downloads a lot, so give it 10–20 minutes.
3. **Build → Build App Bundle(s) / APK(s) → Build APK(s)**. When it finishes, click **locate** in the pop-up. The file is `app/build/outputs/apk/debug/app-debug.apk`.

## Changing things later

- **The look and the tools** live in one file: `web/index.html`. After editing it, run `python3 tools/build_web.py` (GitHub does this step for you automatically).
- **App name** on the home screen: `app/src/main/res/values/strings.xml`.
- **App icon**: `app/src/main/res/drawable/ic_launcher_foreground.xml` and the `mipmap-*` folders.
- **Version number**: `versionCode` and `versionName` in `app/build.gradle`. Raise `versionCode` by 1 each time so your phone treats the new APK as an update.


## Folder map

```
web/index.html          the viewer screen, tools and settings (edit this)
web/lib, web/fonts      3D library (three.js, MIT licence) and fonts (Open Font Licence)
app/src/main/...        the Android wrapper around the viewer
desktop/                the Windows wrapper (Electron): main.js, installer settings, icon
tools/build_web.py      copies the viewer into the Android app
.github/workflows/      instructions GitHub follows to build the Android and Windows apps
```

## License

Facet is open source under the [MIT License](LICENSE): free to use, change and share, as long as the license notice is kept. The bundled 3D library (three.js) is also MIT, and the fonts use the SIL Open Font License (see `web/lib` and `web/fonts`).
