# 🦴 Skeleton Loader – FlutterFlow Custom Widget

A fully customizable **Skeleton Loader** with smooth shimmer animation for FlutterFlow. Drop it into any project to create beautiful loading states in seconds.

**Weekly FlutterFlow Custom Code** by [Rapivio](https://github.com/rapivio)

---

## ✨ Features

- 🌊 **Smooth shimmer animation** – eye-catching gradient sweep effect
- 🎨 **5 layout presets** – `listItem`, `card`, `profile`, `text`, `custom`
- ⚙️ **Fully configurable** – colors, speed, border radius, line count, spacing
- 👤 **Optional avatar** – circular placeholder for profile/list layouts
- 🚀 **Zero dependencies** – pure Flutter, no extra packages needed
- 📱 **Responsive** – works on any screen size

---

## 📸 Preview

| Card | List Item |
|------|-----------|
| <img width="384" height="424" alt="image" src="https://github.com/user-attachments/assets/d43c14cc-647f-4ec9-8c85-b2f55dc58339" /> | <img width="336" height="111" alt="image" src="https://github.com/user-attachments/assets/f26f622a-3766-4d5f-bec9-5f559d21f5f6" />
 

---

## 🔧 Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | `double?` | — | Widget width |
| `height` | `double?` | — | Widget height |
| `layoutPreset` | `String` | `listItem` | Layout: `listItem`, `card`, `profile`, `text`, `custom` |
| `lineCount` | `int` | `3` | Number of text lines (text/custom presets) |
| `baseColor` | `Color?` | `grey.shade300` | Base skeleton color |
| `highlightColor` | `Color?` | `grey.shade100` | Shimmer highlight color |
| `shimmerSpeed` | `int` | `1500` | Animation duration in ms |
| `borderRadius` | `double` | `8.0` | Corner radius |
| `showAvatar` | `bool` | `false` | Show avatar circle (custom preset) |
| `avatarSize` | `double` | `48.0` | Avatar diameter |
| `lineSpacing` | `double` | `12.0` | Space between lines |
| `animate` | `bool` | `true` | Enable/disable shimmer |

---

## 🚀 How to Use in FlutterFlow

### Step 1 – Add Custom Widget
1. Open your FlutterFlow project
2. Go to **Custom Code** → **Custom Widgets** → **+ Create**
3. Name it `SkeletonLoader`
4. Add all parameters from the table above
5. Paste the code from [`skeleton_loader.dart`](skeleton_loader.dart)

### Step 2 – Use It
- Drag the `SkeletonLoader` widget onto any page
- Set `layoutPreset` to match your content layout
- Customize colors and animation speed to match your theme

### Step 3 – Show/Hide on Load
Wrap the `SkeletonLoader` with **Conditional Visibility** – show it while your API call is loading, hide it when data arrives.

---

## 📋 Preset Examples

**Chat / Contact List:**
```
layoutPreset: "listItem"
width: 350
shimmerSpeed: 1200
```

**Blog / Feed Card:**
```
layoutPreset: "card"
width: 350
borderRadius: 12
```

**User Profile:**
```
layoutPreset: "profile"
width: 300
avatarSize: 48
```

**Text Placeholder:**
```
layoutPreset: "text"
lineCount: 4
lineSpacing: 10
```

---

## 💡 Pro Tips

- **Dark Mode:** Use `baseColor: grey.shade800` and `highlightColor: grey.shade700`
- **Stack multiple:** Put several `listItem` loaders in a `Column` to simulate a full list
- **Match your theme:** Set colors to your app's palette for a polished look
- **Static mode:** Set `animate: false` for non-animated skeletons (useful for screenshots)

---

## 📄 License

[MIT](LICENSE) – Free to use in personal and commercial projects.

---

**Part of the [Weekly FlutterFlow Custom Code](https://github.com/rapivio) series** ✌️
