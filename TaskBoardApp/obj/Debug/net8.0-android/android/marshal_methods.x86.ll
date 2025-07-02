; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [328 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [650 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 183
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 244
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 278
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 142
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 319
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 194
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 262
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 262
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 136
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 282
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 218
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 264
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 148
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 316
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 317
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 216
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 238
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 221
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 144
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 240
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 237
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 288
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 316
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 207
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 301
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 239
	i32 347068432, ; 48: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 197
	i32 356389973, ; 49: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 300
	i32 360082299, ; 50: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 51: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 52: System.Transactions.Local => 0x1658bf94 => 146
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 142
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 143
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 324
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 162
	i32 435591531, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 312
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 222
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 235
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 149
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 163
	i32 469710990, ; 67: System.dll => 0x1bff388e => 161
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 237
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 250
	i32 498788369, ; 70: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 71: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 299
	i32 503918385, ; 72: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 293
	i32 513247710, ; 73: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 188
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 147
	i32 527452488, ; 75: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 282
	i32 530272170, ; 76: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 184
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 275
	i32 569601784, ; 83: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 273
	i32 577335427, ; 84: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 85: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 307
	i32 601371474, ; 86: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 87: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 88: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 89: Xamarin.AndroidX.CustomView => 0x2568904f => 227
	i32 627931235, ; 90: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 305
	i32 639843206, ; 91: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 233
	i32 643868501, ; 92: System.Net => 0x2660a755 => 80
	i32 662205335, ; 93: System.Text.Encodings.Web.dll => 0x27787397 => 201
	i32 663517072, ; 94: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 269
	i32 666292255, ; 95: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 214
	i32 672442732, ; 96: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 97: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 98: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 287
	i32 690569205, ; 99: System.Xml.Linq.dll => 0x29293ff5 => 152
	i32 691348768, ; 100: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 284
	i32 693804605, ; 101: System.Windows => 0x295a9e3d => 151
	i32 699345723, ; 102: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 103: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 279
	i32 700358131, ; 104: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 105: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 302
	i32 709557578, ; 106: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 290
	i32 720511267, ; 107: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 283
	i32 722857257, ; 108: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 109: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 748832960, ; 110: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 195
	i32 752232764, ; 111: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 112: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 204
	i32 759454413, ; 113: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 114: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 115: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 116: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 311
	i32 789151979, ; 117: Microsoft.Extensions.Options => 0x2f0980eb => 187
	i32 790371945, ; 118: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 228
	i32 804715423, ; 119: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 120: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 242
	i32 823281589, ; 121: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 122: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 123: System.Xml.XPath.dll => 0x31a103c6 => 157
	i32 834051424, ; 124: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 125: Xamarin.AndroidX.Print => 0x3246f6cd => 255
	i32 873119928, ; 126: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 127: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 128: System.Net.Http.Json => 0x3463c971 => 62
	i32 904024072, ; 129: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 130: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 131: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 314
	i32 928116545, ; 132: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 278
	i32 952186615, ; 133: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 956575887, ; 134: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 283
	i32 966729478, ; 135: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 276
	i32 967690846, ; 136: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 239
	i32 975236339, ; 137: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 138: System.Xml.XDocument => 0x3a2aaa1d => 155
	i32 986514023, ; 139: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 140: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 141: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 142: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 143: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 144: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 259
	i32 1019214401, ; 145: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 146: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 182
	i32 1029334545, ; 147: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 289
	i32 1031528504, ; 148: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 277
	i32 1035644815, ; 149: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 212
	i32 1036536393, ; 150: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 151: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 152: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 246
	i32 1067306892, ; 153: GoogleGson => 0x3f9dcf8c => 171
	i32 1082857460, ; 154: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 155: Xamarin.Kotlin.StdLib => 0x409e66d8 => 280
	i32 1098259244, ; 156: System => 0x41761b2c => 161
	i32 1118262833, ; 157: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 302
	i32 1121599056, ; 158: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 245
	i32 1127624469, ; 159: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 186
	i32 1149092582, ; 160: Xamarin.AndroidX.Window => 0x447dc2e6 => 272
	i32 1157931901, ; 161: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 174
	i32 1168523401, ; 162: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 308
	i32 1170634674, ; 163: System.Web.dll => 0x45c677b2 => 150
	i32 1175144683, ; 164: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 268
	i32 1178241025, ; 165: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 253
	i32 1202000627, ; 166: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 174
	i32 1203215381, ; 167: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 306
	i32 1204270330, ; 168: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 214
	i32 1204575371, ; 169: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 178
	i32 1208641965, ; 170: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 171: CommunityToolkit.Mvvm => 0x4868cc7b => 170
	i32 1219128291, ; 172: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 173: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 304
	i32 1243150071, ; 174: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 273
	i32 1253011324, ; 175: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 176: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 288
	i32 1264511973, ; 177: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 263
	i32 1267360935, ; 178: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 267
	i32 1273260888, ; 179: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 219
	i32 1275534314, ; 180: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 284
	i32 1278448581, ; 181: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 211
	i32 1292207520, ; 182: SQLitePCLRaw.core.dll => 0x4d0585a0 => 196
	i32 1293217323, ; 183: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 230
	i32 1309188875, ; 184: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1322716291, ; 185: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 272
	i32 1324164729, ; 186: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 187: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 188: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 189: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 318
	i32 1376866003, ; 190: Xamarin.AndroidX.SavedState => 0x52114ed3 => 259
	i32 1379779777, ; 191: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1402170036, ; 192: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 193: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 223
	i32 1408764838, ; 194: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 195: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 196: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 197: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 286
	i32 1434145427, ; 198: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 199: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 276
	i32 1439761251, ; 200: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 201: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 202: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 203: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 204: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 205: es\Microsoft.Maui.Controls.resources => 0x57152abe => 292
	i32 1461234159, ; 206: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 207: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 208: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 209: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 213
	i32 1470490898, ; 210: Microsoft.Extensions.Primitives => 0x57a5e912 => 188
	i32 1479771757, ; 211: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 212: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 213: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 214: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 260
	i32 1490351284, ; 215: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 172
	i32 1493001747, ; 216: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 296
	i32 1514721132, ; 217: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 291
	i32 1536373174, ; 218: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 219: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 135
	i32 1543355203, ; 220: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 221: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 222: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 311
	i32 1565862583, ; 223: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 224: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 138
	i32 1573704789, ; 225: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 226: System.Threading.Overlapped => 0x5e2d7514 => 137
	i32 1582372066, ; 227: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 229
	i32 1592978981, ; 228: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 229: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 277
	i32 1601112923, ; 230: System.Xml.Serialization => 0x5f6f0b5b => 154
	i32 1603525486, ; 231: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 320
	i32 1604827217, ; 232: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 233: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 234: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 249
	i32 1622358360, ; 235: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 236: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 271
	i32 1635184631, ; 237: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 233
	i32 1636350590, ; 238: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 226
	i32 1639515021, ; 239: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 240: System.Text.RegularExpressions => 0x61c036ca => 135
	i32 1641389582, ; 241: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 242: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 243: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 265
	i32 1658251792, ; 244: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 274
	i32 1670060433, ; 245: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 221
	i32 1675553242, ; 246: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 247: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 248: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 249: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1688112883, ; 250: Microsoft.Data.Sqlite => 0x649e8ef3 => 172
	i32 1689493916, ; 251: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 173
	i32 1691477237, ; 252: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 253: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 254: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 281
	i32 1701541528, ; 255: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 256: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 197
	i32 1720223769, ; 257: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 242
	i32 1726116996, ; 258: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 259: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 260: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 217
	i32 1736233607, ; 261: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 309
	i32 1743415430, ; 262: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 287
	i32 1744735666, ; 263: System.Transactions.Local.dll => 0x67fe8db2 => 146
	i32 1746115085, ; 264: System.IO.Pipelines.dll => 0x68139a0d => 200
	i32 1746316138, ; 265: Mono.Android.Export => 0x6816ab6a => 166
	i32 1750313021, ; 266: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 267: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 268: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 269: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 270: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 264
	i32 1770582343, ; 271: Microsoft.Extensions.Logging.dll => 0x6988f147 => 184
	i32 1776026572, ; 272: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 273: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 274: Mono.Android.Runtime.dll => 0x6a216153 => 167
	i32 1782862114, ; 275: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 303
	i32 1788241197, ; 276: Xamarin.AndroidX.Fragment => 0x6a96652d => 235
	i32 1793755602, ; 277: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 295
	i32 1808609942, ; 278: Xamarin.AndroidX.Loader => 0x6bcd3296 => 249
	i32 1813058853, ; 279: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 280
	i32 1813201214, ; 280: Xamarin.Google.Android.Material => 0x6c13413e => 274
	i32 1818569960, ; 281: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 254
	i32 1818787751, ; 282: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 283: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 284: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1827303595, ; 285: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 322
	i32 1828688058, ; 286: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 185
	i32 1842015223, ; 287: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 315
	i32 1847515442, ; 288: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 204
	i32 1853025655, ; 289: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 312
	i32 1858542181, ; 290: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 291: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 292: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 294
	i32 1879696579, ; 293: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 294: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 215
	i32 1885918049, ; 295: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 322
	i32 1886040351, ; 296: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 176
	i32 1888955245, ; 297: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 298: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 299: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 300: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 301: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 302: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1956758971, ; 303: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 304: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 261
	i32 1968388702, ; 305: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 179
	i32 1983156543, ; 306: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 281
	i32 1985761444, ; 307: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 206
	i32 2003115576, ; 308: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 291
	i32 2011961780, ; 309: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014489277, ; 310: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 176
	i32 2019465201, ; 311: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 246
	i32 2025202353, ; 312: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 286
	i32 2031763787, ; 313: Xamarin.Android.Glide => 0x791a414b => 203
	i32 2045470958, ; 314: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 315: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 241
	i32 2060060697, ; 316: System.Windows.dll => 0x7aca0819 => 151
	i32 2066184531, ; 317: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 290
	i32 2070888862, ; 318: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 319: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 320: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2103459038, ; 321: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 198
	i32 2117912485, ; 322: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 0x7e3cc7a5 => 323
	i32 2127167465, ; 323: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 324: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 325: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 159
	i32 2146852085, ; 326: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 327: Microsoft.Maui => 0x80bd55ad => 192
	i32 2169148018, ; 328: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 298
	i32 2181898931, ; 329: Microsoft.Extensions.Options.dll => 0x820d22b3 => 187
	i32 2192057212, ; 330: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 185
	i32 2193016926, ; 331: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2197979891, ; 332: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 183
	i32 2201107256, ; 333: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 285
	i32 2201231467, ; 334: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 335: it\Microsoft.Maui.Controls.resources => 0x839595db => 300
	i32 2217644978, ; 336: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 268
	i32 2222056684, ; 337: System.Threading.Tasks.Parallel => 0x8471e4ec => 140
	i32 2244775296, ; 338: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 250
	i32 2252106437, ; 339: System.Xml.Serialization.dll => 0x863c6ac5 => 154
	i32 2252897993, ; 340: Microsoft.EntityFrameworkCore => 0x86487ec9 => 173
	i32 2256313426, ; 341: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 342: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 343: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 180
	i32 2267999099, ; 344: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 205
	i32 2270573516, ; 345: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 294
	i32 2279755925, ; 346: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 257
	i32 2293034957, ; 347: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 348: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 349: System.Net.Mail => 0x88ffe49e => 65
	i32 2303942373, ; 350: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 304
	i32 2305521784, ; 351: System.Private.CoreLib.dll => 0x896b7878 => 169
	i32 2315684594, ; 352: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 209
	i32 2320631194, ; 353: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 140
	i32 2340441535, ; 354: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 355: System.ValueTuple => 0x8bbaa2cd => 148
	i32 2353062107, ; 356: System.Net.Primitives => 0x8c40e0db => 69
	i32 2368005991, ; 357: System.Xml.ReaderWriter.dll => 0x8d24e767 => 153
	i32 2371007202, ; 358: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 179
	i32 2378619854, ; 359: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 360: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 361: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 299
	i32 2401565422, ; 362: System.Web.HttpUtility => 0x8f24faee => 149
	i32 2403452196, ; 363: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 232
	i32 2409983638, ; 364: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 321
	i32 2421380589, ; 365: System.Threading.Tasks.Dataflow => 0x905355ed => 138
	i32 2423080555, ; 366: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 219
	i32 2427813419, ; 367: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 296
	i32 2435356389, ; 368: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 369: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 370: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 371: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 372: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465273461, ; 373: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 195
	i32 2465532216, ; 374: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 222
	i32 2471841756, ; 375: netstandard.dll => 0x93554fdc => 164
	i32 2475788418, ; 376: Java.Interop.dll => 0x93918882 => 165
	i32 2480646305, ; 377: Microsoft.Maui.Controls => 0x93dba8a1 => 190
	i32 2483903535, ; 378: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 379: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 380: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 381: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 382: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 244
	i32 2522472828, ; 383: Xamarin.Android.Glide.dll => 0x9659e17c => 203
	i32 2538310050, ; 384: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 385: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 297
	i32 2562349572, ; 386: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 387: System.Text.Encodings.Web => 0x9930ee42 => 201
	i32 2581783588, ; 388: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 245
	i32 2581819634, ; 389: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 267
	i32 2585220780, ; 390: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 391: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 392: System.Threading.ThreadPool => 0x9a5a3337 => 143
	i32 2593496499, ; 393: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 306
	i32 2605712449, ; 394: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 285
	i32 2615233544, ; 395: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 236
	i32 2616218305, ; 396: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 186
	i32 2617129537, ; 397: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 398: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 399: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 226
	i32 2624644809, ; 400: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 231
	i32 2626831493, ; 401: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 301
	i32 2627185994, ; 402: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 403: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 404: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 240
	i32 2634653062, ; 405: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 175
	i32 2663391936, ; 406: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 205
	i32 2663698177, ; 407: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 408: System.Xml.XDocument.dll => 0x9ecf752a => 155
	i32 2665622720, ; 409: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 410: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 411: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 412: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 413: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 265
	i32 2715334215, ; 414: System.Threading.Tasks.dll => 0xa1d8b647 => 141
	i32 2717744543, ; 415: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 416: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 417: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 418: Xamarin.AndroidX.Activity => 0xa2e0939b => 207
	i32 2735172069, ; 419: System.Threading.Channels => 0xa30769e5 => 136
	i32 2737747696, ; 420: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 213
	i32 2740948882, ; 421: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 422: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 423: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 307
	i32 2758225723, ; 424: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 191
	i32 2764765095, ; 425: Microsoft.Maui.dll => 0xa4caf7a7 => 192
	i32 2765824710, ; 426: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 427: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 279
	i32 2778768386, ; 428: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 270
	i32 2779977773, ; 429: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 258
	i32 2785988530, ; 430: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 313
	i32 2788224221, ; 431: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 236
	i32 2801831435, ; 432: Microsoft.Maui.Graphics => 0xa7008e0b => 194
	i32 2803228030, ; 433: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 156
	i32 2806116107, ; 434: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 292
	i32 2810250172, ; 435: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 223
	i32 2819470561, ; 436: System.Xml.dll => 0xa80db4e1 => 160
	i32 2821205001, ; 437: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 438: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 258
	i32 2824502124, ; 439: System.Xml.XmlDocument => 0xa85a7b6c => 158
	i32 2831556043, ; 440: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 305
	i32 2838993487, ; 441: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 247
	i32 2847789619, ; 442: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 175
	i32 2849599387, ; 443: System.Threading.Overlapped.dll => 0xa9d96f9b => 137
	i32 2853208004, ; 444: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 270
	i32 2855708567, ; 445: Xamarin.AndroidX.Transition => 0xaa36a797 => 266
	i32 2861098320, ; 446: Mono.Android.Export.dll => 0xaa88e550 => 166
	i32 2861189240, ; 447: Microsoft.Maui.Essentials => 0xaa8a4878 => 193
	i32 2870099610, ; 448: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 208
	i32 2875164099, ; 449: Jsr305Binding.dll => 0xab5f85c3 => 275
	i32 2875220617, ; 450: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2883993532, ; 451: TaskBoardApp.dll => 0xabe63fbc => 0
	i32 2884993177, ; 452: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 234
	i32 2887636118, ; 453: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 454: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 455: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 456: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 457: mscorlib.dll => 0xad2a79b6 => 163
	i32 2909740682, ; 458: System.Private.CoreLib => 0xad6f1e8a => 169
	i32 2916838712, ; 459: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 271
	i32 2919462931, ; 460: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 461: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 210
	i32 2921601239, ; 462: TaskBoardApp => 0xae2418d7 => 0
	i32 2936416060, ; 463: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 464: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 465: System.Xml.XPath.XDocument => 0xaf624531 => 156
	i32 2959614098, ; 466: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 467: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 468: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 469: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 230
	i32 2987532451, ; 470: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 261
	i32 2996846495, ; 471: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 243
	i32 3016983068, ; 472: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 263
	i32 3023353419, ; 473: WindowsBase.dll => 0xb434b64b => 162
	i32 3024354802, ; 474: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 238
	i32 3038032645, ; 475: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 324
	i32 3056245963, ; 476: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 260
	i32 3057625584, ; 477: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 251
	i32 3059408633, ; 478: Mono.Android.Runtime => 0xb65adef9 => 167
	i32 3059793426, ; 479: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 480: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 177
	i32 3075834255, ; 481: System.Threading.Tasks => 0xb755818f => 141
	i32 3077302341, ; 482: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 298
	i32 3090735792, ; 483: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 484: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 485: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 486: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 487: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 488: System.Threading.Tasks.Extensions => 0xba4127cb => 139
	i32 3132293585, ; 489: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3147165239, ; 490: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 491: GoogleGson.dll => 0xbba64c02 => 171
	i32 3159123045, ; 492: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 493: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 494: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 252
	i32 3192346100, ; 495: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 496: System.Web => 0xbe592c0c => 150
	i32 3195844289, ; 497: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 177
	i32 3204380047, ; 498: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 499: System.Xml.XmlDocument.dll => 0xbf506931 => 158
	i32 3211777861, ; 500: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 229
	i32 3217618498, ; 501: Microsoft.VisualStudio.DesignTools.XamlTapContract => 0xbfc8f642 => 323
	i32 3220365878, ; 502: System.Threading => 0xbff2e236 => 145
	i32 3226221578, ; 503: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 504: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 505: Xamarin.AndroidX.CardView => 0xc235e84d => 217
	i32 3265493905, ; 506: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 507: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 139
	i32 3277815716, ; 508: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 509: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 510: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 511: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 512: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 513: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 514: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 293
	i32 3316684772, ; 515: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 516: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 227
	i32 3317144872, ; 517: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 518: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 215
	i32 3345895724, ; 519: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 256
	i32 3346324047, ; 520: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 253
	i32 3357674450, ; 521: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 310
	i32 3358260929, ; 522: System.Text.Json => 0xc82afec1 => 202
	i32 3360279109, ; 523: SQLitePCLRaw.core => 0xc849ca45 => 196
	i32 3362336904, ; 524: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 208
	i32 3362522851, ; 525: Xamarin.AndroidX.Core => 0xc86c06e3 => 224
	i32 3366347497, ; 526: Java.Interop => 0xc8a662e9 => 165
	i32 3374999561, ; 527: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 257
	i32 3381016424, ; 528: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 289
	i32 3395150330, ; 529: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 530: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 531: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 228
	i32 3428513518, ; 532: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 181
	i32 3429136800, ; 533: System.Xml => 0xcc6479a0 => 160
	i32 3430777524, ; 534: netstandard => 0xcc7d82b4 => 164
	i32 3441283291, ; 535: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 231
	i32 3445260447, ; 536: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 537: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 189
	i32 3463511458, ; 538: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 297
	i32 3471940407, ; 539: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 540: Mono.Android => 0xcf3163e6 => 168
	i32 3479583265, ; 541: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 310
	i32 3484440000, ; 542: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 309
	i32 3485117614, ; 543: System.Text.Json.dll => 0xcfbaacae => 202
	i32 3486566296, ; 544: System.Transactions => 0xcfd0c798 => 147
	i32 3493954962, ; 545: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 220
	i32 3509114376, ; 546: System.Xml.Linq => 0xd128d608 => 152
	i32 3515174580, ; 547: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 548: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 549: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 550: System.Threading.Timer => 0xd432d20b => 144
	i32 3570554715, ; 551: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 552: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 317
	i32 3597029428, ; 553: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 206
	i32 3598340787, ; 554: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 555: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 556: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 557: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 255
	i32 3633644679, ; 558: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 210
	i32 3638274909, ; 559: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 560: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 241
	i32 3643446276, ; 561: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 314
	i32 3643854240, ; 562: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 252
	i32 3645089577, ; 563: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 564: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 180
	i32 3660523487, ; 565: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 566: Mono.Android.dll => 0xdae8aa5e => 168
	i32 3676670898, ; 567: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 320
	i32 3682565725, ; 568: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 216
	i32 3684561358, ; 569: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 220
	i32 3697841164, ; 570: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 319
	i32 3700866549, ; 571: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 572: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 225
	i32 3716563718, ; 573: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 574: Xamarin.AndroidX.Annotation => 0xdda814c6 => 209
	i32 3724971120, ; 575: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 251
	i32 3732100267, ; 576: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 577: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 578: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 199
	i32 3751444290, ; 579: System.Xml.XPath => 0xdf9a7f42 => 157
	i32 3754567612, ; 580: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 198
	i32 3786282454, ; 581: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 218
	i32 3792276235, ; 582: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 583: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 189
	i32 3802395368, ; 584: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 585: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 586: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 587: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 588: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 182
	i32 3844307129, ; 589: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 590: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 591: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 592: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 593: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 594: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 595: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 266
	i32 3888767677, ; 596: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 256
	i32 3889960447, ; 597: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 318
	i32 3896106733, ; 598: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 599: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 224
	i32 3901907137, ; 600: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 601: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 602: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 269
	i32 3928044579, ; 603: System.Xml.ReaderWriter => 0xea213423 => 153
	i32 3930554604, ; 604: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 605: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 254
	i32 3945713374, ; 606: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 607: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 608: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 212
	i32 3959773229, ; 609: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 243
	i32 3980434154, ; 610: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 313
	i32 3987592930, ; 611: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 295
	i32 4003436829, ; 612: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 613: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 211
	i32 4023392905, ; 614: System.IO.Pipelines => 0xefd01a89 => 200
	i32 4025784931, ; 615: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 616: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 191
	i32 4054681211, ; 617: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 618: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 619: System.Threading.dll => 0xf2ce3c98 => 145
	i32 4094352644, ; 620: Microsoft.Maui.Essentials.dll => 0xf40add04 => 193
	i32 4099507663, ; 621: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 622: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 623: Xamarin.AndroidX.Emoji2 => 0xf479582c => 232
	i32 4101842092, ; 624: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 178
	i32 4102112229, ; 625: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 308
	i32 4125707920, ; 626: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 303
	i32 4126470640, ; 627: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 181
	i32 4127667938, ; 628: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 629: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 630: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 631: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 315
	i32 4151237749, ; 632: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 633: System.Xml.XmlSerializer => 0xf7e95c85 => 159
	i32 4161255271, ; 634: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 635: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 636: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 637: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 248
	i32 4182880526, ; 638: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 321
	i32 4185676441, ; 639: System.Security => 0xf97c5a99 => 129
	i32 4196529839, ; 640: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 641: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 199
	i32 4256097574, ; 642: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 225
	i32 4258378803, ; 643: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 247
	i32 4260525087, ; 644: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 645: Microsoft.Maui.Controls.dll => 0xfea12dee => 190
	i32 4274623895, ; 646: CommunityToolkit.Mvvm.dll => 0xfec99597 => 170
	i32 4274976490, ; 647: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 648: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 248
	i32 4294763496 ; 649: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 234
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [650 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 183, ; 3
	i32 244, ; 4
	i32 278, ; 5
	i32 47, ; 6
	i32 79, ; 7
	i32 142, ; 8
	i32 29, ; 9
	i32 319, ; 10
	i32 123, ; 11
	i32 194, ; 12
	i32 101, ; 13
	i32 262, ; 14
	i32 106, ; 15
	i32 262, ; 16
	i32 136, ; 17
	i32 282, ; 18
	i32 76, ; 19
	i32 123, ; 20
	i32 13, ; 21
	i32 218, ; 22
	i32 131, ; 23
	i32 264, ; 24
	i32 148, ; 25
	i32 316, ; 26
	i32 317, ; 27
	i32 18, ; 28
	i32 216, ; 29
	i32 26, ; 30
	i32 238, ; 31
	i32 1, ; 32
	i32 58, ; 33
	i32 41, ; 34
	i32 90, ; 35
	i32 221, ; 36
	i32 144, ; 37
	i32 240, ; 38
	i32 237, ; 39
	i32 288, ; 40
	i32 53, ; 41
	i32 68, ; 42
	i32 316, ; 43
	i32 207, ; 44
	i32 82, ; 45
	i32 301, ; 46
	i32 239, ; 47
	i32 197, ; 48
	i32 300, ; 49
	i32 130, ; 50
	i32 54, ; 51
	i32 146, ; 52
	i32 73, ; 53
	i32 142, ; 54
	i32 61, ; 55
	i32 143, ; 56
	i32 324, ; 57
	i32 162, ; 58
	i32 312, ; 59
	i32 222, ; 60
	i32 12, ; 61
	i32 235, ; 62
	i32 124, ; 63
	i32 149, ; 64
	i32 112, ; 65
	i32 163, ; 66
	i32 161, ; 67
	i32 237, ; 68
	i32 250, ; 69
	i32 83, ; 70
	i32 299, ; 71
	i32 293, ; 72
	i32 188, ; 73
	i32 147, ; 74
	i32 282, ; 75
	i32 59, ; 76
	i32 184, ; 77
	i32 50, ; 78
	i32 102, ; 79
	i32 113, ; 80
	i32 39, ; 81
	i32 275, ; 82
	i32 273, ; 83
	i32 119, ; 84
	i32 307, ; 85
	i32 51, ; 86
	i32 43, ; 87
	i32 118, ; 88
	i32 227, ; 89
	i32 305, ; 90
	i32 233, ; 91
	i32 80, ; 92
	i32 201, ; 93
	i32 269, ; 94
	i32 214, ; 95
	i32 8, ; 96
	i32 72, ; 97
	i32 287, ; 98
	i32 152, ; 99
	i32 284, ; 100
	i32 151, ; 101
	i32 91, ; 102
	i32 279, ; 103
	i32 44, ; 104
	i32 302, ; 105
	i32 290, ; 106
	i32 283, ; 107
	i32 108, ; 108
	i32 128, ; 109
	i32 195, ; 110
	i32 25, ; 111
	i32 204, ; 112
	i32 71, ; 113
	i32 54, ; 114
	i32 45, ; 115
	i32 311, ; 116
	i32 187, ; 117
	i32 228, ; 118
	i32 22, ; 119
	i32 242, ; 120
	i32 85, ; 121
	i32 42, ; 122
	i32 157, ; 123
	i32 70, ; 124
	i32 255, ; 125
	i32 3, ; 126
	i32 41, ; 127
	i32 62, ; 128
	i32 16, ; 129
	i32 52, ; 130
	i32 314, ; 131
	i32 278, ; 132
	i32 104, ; 133
	i32 283, ; 134
	i32 276, ; 135
	i32 239, ; 136
	i32 33, ; 137
	i32 155, ; 138
	i32 84, ; 139
	i32 31, ; 140
	i32 12, ; 141
	i32 50, ; 142
	i32 55, ; 143
	i32 259, ; 144
	i32 35, ; 145
	i32 182, ; 146
	i32 289, ; 147
	i32 277, ; 148
	i32 212, ; 149
	i32 34, ; 150
	i32 57, ; 151
	i32 246, ; 152
	i32 171, ; 153
	i32 17, ; 154
	i32 280, ; 155
	i32 161, ; 156
	i32 302, ; 157
	i32 245, ; 158
	i32 186, ; 159
	i32 272, ; 160
	i32 174, ; 161
	i32 308, ; 162
	i32 150, ; 163
	i32 268, ; 164
	i32 253, ; 165
	i32 174, ; 166
	i32 306, ; 167
	i32 214, ; 168
	i32 178, ; 169
	i32 28, ; 170
	i32 170, ; 171
	i32 51, ; 172
	i32 304, ; 173
	i32 273, ; 174
	i32 5, ; 175
	i32 288, ; 176
	i32 263, ; 177
	i32 267, ; 178
	i32 219, ; 179
	i32 284, ; 180
	i32 211, ; 181
	i32 196, ; 182
	i32 230, ; 183
	i32 84, ; 184
	i32 272, ; 185
	i32 60, ; 186
	i32 111, ; 187
	i32 56, ; 188
	i32 318, ; 189
	i32 259, ; 190
	i32 98, ; 191
	i32 19, ; 192
	i32 223, ; 193
	i32 110, ; 194
	i32 100, ; 195
	i32 101, ; 196
	i32 286, ; 197
	i32 103, ; 198
	i32 276, ; 199
	i32 70, ; 200
	i32 37, ; 201
	i32 31, ; 202
	i32 102, ; 203
	i32 72, ; 204
	i32 292, ; 205
	i32 9, ; 206
	i32 122, ; 207
	i32 45, ; 208
	i32 213, ; 209
	i32 188, ; 210
	i32 9, ; 211
	i32 42, ; 212
	i32 4, ; 213
	i32 260, ; 214
	i32 172, ; 215
	i32 296, ; 216
	i32 291, ; 217
	i32 30, ; 218
	i32 135, ; 219
	i32 91, ; 220
	i32 92, ; 221
	i32 311, ; 222
	i32 48, ; 223
	i32 138, ; 224
	i32 111, ; 225
	i32 137, ; 226
	i32 229, ; 227
	i32 114, ; 228
	i32 277, ; 229
	i32 154, ; 230
	i32 320, ; 231
	i32 75, ; 232
	i32 78, ; 233
	i32 249, ; 234
	i32 36, ; 235
	i32 271, ; 236
	i32 233, ; 237
	i32 226, ; 238
	i32 63, ; 239
	i32 135, ; 240
	i32 15, ; 241
	i32 115, ; 242
	i32 265, ; 243
	i32 274, ; 244
	i32 221, ; 245
	i32 47, ; 246
	i32 69, ; 247
	i32 79, ; 248
	i32 125, ; 249
	i32 172, ; 250
	i32 173, ; 251
	i32 93, ; 252
	i32 120, ; 253
	i32 281, ; 254
	i32 26, ; 255
	i32 197, ; 256
	i32 242, ; 257
	i32 96, ; 258
	i32 27, ; 259
	i32 217, ; 260
	i32 309, ; 261
	i32 287, ; 262
	i32 146, ; 263
	i32 200, ; 264
	i32 166, ; 265
	i32 4, ; 266
	i32 97, ; 267
	i32 32, ; 268
	i32 92, ; 269
	i32 264, ; 270
	i32 184, ; 271
	i32 21, ; 272
	i32 40, ; 273
	i32 167, ; 274
	i32 303, ; 275
	i32 235, ; 276
	i32 295, ; 277
	i32 249, ; 278
	i32 280, ; 279
	i32 274, ; 280
	i32 254, ; 281
	i32 2, ; 282
	i32 133, ; 283
	i32 110, ; 284
	i32 322, ; 285
	i32 185, ; 286
	i32 315, ; 287
	i32 204, ; 288
	i32 312, ; 289
	i32 57, ; 290
	i32 94, ; 291
	i32 294, ; 292
	i32 38, ; 293
	i32 215, ; 294
	i32 322, ; 295
	i32 176, ; 296
	i32 25, ; 297
	i32 93, ; 298
	i32 88, ; 299
	i32 98, ; 300
	i32 10, ; 301
	i32 86, ; 302
	i32 99, ; 303
	i32 261, ; 304
	i32 179, ; 305
	i32 281, ; 306
	i32 206, ; 307
	i32 291, ; 308
	i32 7, ; 309
	i32 176, ; 310
	i32 246, ; 311
	i32 286, ; 312
	i32 203, ; 313
	i32 87, ; 314
	i32 241, ; 315
	i32 151, ; 316
	i32 290, ; 317
	i32 32, ; 318
	i32 115, ; 319
	i32 81, ; 320
	i32 198, ; 321
	i32 323, ; 322
	i32 20, ; 323
	i32 11, ; 324
	i32 159, ; 325
	i32 3, ; 326
	i32 192, ; 327
	i32 298, ; 328
	i32 187, ; 329
	i32 185, ; 330
	i32 83, ; 331
	i32 183, ; 332
	i32 285, ; 333
	i32 63, ; 334
	i32 300, ; 335
	i32 268, ; 336
	i32 140, ; 337
	i32 250, ; 338
	i32 154, ; 339
	i32 173, ; 340
	i32 40, ; 341
	i32 116, ; 342
	i32 180, ; 343
	i32 205, ; 344
	i32 294, ; 345
	i32 257, ; 346
	i32 130, ; 347
	i32 74, ; 348
	i32 65, ; 349
	i32 304, ; 350
	i32 169, ; 351
	i32 209, ; 352
	i32 140, ; 353
	i32 105, ; 354
	i32 148, ; 355
	i32 69, ; 356
	i32 153, ; 357
	i32 179, ; 358
	i32 120, ; 359
	i32 126, ; 360
	i32 299, ; 361
	i32 149, ; 362
	i32 232, ; 363
	i32 321, ; 364
	i32 138, ; 365
	i32 219, ; 366
	i32 296, ; 367
	i32 20, ; 368
	i32 14, ; 369
	i32 134, ; 370
	i32 74, ; 371
	i32 58, ; 372
	i32 195, ; 373
	i32 222, ; 374
	i32 164, ; 375
	i32 165, ; 376
	i32 190, ; 377
	i32 15, ; 378
	i32 73, ; 379
	i32 6, ; 380
	i32 23, ; 381
	i32 244, ; 382
	i32 203, ; 383
	i32 90, ; 384
	i32 297, ; 385
	i32 1, ; 386
	i32 201, ; 387
	i32 245, ; 388
	i32 267, ; 389
	i32 133, ; 390
	i32 68, ; 391
	i32 143, ; 392
	i32 306, ; 393
	i32 285, ; 394
	i32 236, ; 395
	i32 186, ; 396
	i32 87, ; 397
	i32 95, ; 398
	i32 226, ; 399
	i32 231, ; 400
	i32 301, ; 401
	i32 30, ; 402
	i32 44, ; 403
	i32 240, ; 404
	i32 175, ; 405
	i32 205, ; 406
	i32 108, ; 407
	i32 155, ; 408
	i32 34, ; 409
	i32 22, ; 410
	i32 113, ; 411
	i32 56, ; 412
	i32 265, ; 413
	i32 141, ; 414
	i32 117, ; 415
	i32 119, ; 416
	i32 109, ; 417
	i32 207, ; 418
	i32 136, ; 419
	i32 213, ; 420
	i32 53, ; 421
	i32 104, ; 422
	i32 307, ; 423
	i32 191, ; 424
	i32 192, ; 425
	i32 132, ; 426
	i32 279, ; 427
	i32 270, ; 428
	i32 258, ; 429
	i32 313, ; 430
	i32 236, ; 431
	i32 194, ; 432
	i32 156, ; 433
	i32 292, ; 434
	i32 223, ; 435
	i32 160, ; 436
	i32 131, ; 437
	i32 258, ; 438
	i32 158, ; 439
	i32 305, ; 440
	i32 247, ; 441
	i32 175, ; 442
	i32 137, ; 443
	i32 270, ; 444
	i32 266, ; 445
	i32 166, ; 446
	i32 193, ; 447
	i32 208, ; 448
	i32 275, ; 449
	i32 39, ; 450
	i32 0, ; 451
	i32 234, ; 452
	i32 80, ; 453
	i32 55, ; 454
	i32 36, ; 455
	i32 96, ; 456
	i32 163, ; 457
	i32 169, ; 458
	i32 271, ; 459
	i32 81, ; 460
	i32 210, ; 461
	i32 0, ; 462
	i32 97, ; 463
	i32 29, ; 464
	i32 156, ; 465
	i32 18, ; 466
	i32 126, ; 467
	i32 118, ; 468
	i32 230, ; 469
	i32 261, ; 470
	i32 243, ; 471
	i32 263, ; 472
	i32 162, ; 473
	i32 238, ; 474
	i32 324, ; 475
	i32 260, ; 476
	i32 251, ; 477
	i32 167, ; 478
	i32 16, ; 479
	i32 177, ; 480
	i32 141, ; 481
	i32 298, ; 482
	i32 124, ; 483
	i32 117, ; 484
	i32 37, ; 485
	i32 114, ; 486
	i32 46, ; 487
	i32 139, ; 488
	i32 116, ; 489
	i32 33, ; 490
	i32 171, ; 491
	i32 94, ; 492
	i32 52, ; 493
	i32 252, ; 494
	i32 128, ; 495
	i32 150, ; 496
	i32 177, ; 497
	i32 24, ; 498
	i32 158, ; 499
	i32 229, ; 500
	i32 323, ; 501
	i32 145, ; 502
	i32 103, ; 503
	i32 88, ; 504
	i32 217, ; 505
	i32 59, ; 506
	i32 139, ; 507
	i32 99, ; 508
	i32 5, ; 509
	i32 13, ; 510
	i32 121, ; 511
	i32 134, ; 512
	i32 27, ; 513
	i32 293, ; 514
	i32 71, ; 515
	i32 227, ; 516
	i32 24, ; 517
	i32 215, ; 518
	i32 256, ; 519
	i32 253, ; 520
	i32 310, ; 521
	i32 202, ; 522
	i32 196, ; 523
	i32 208, ; 524
	i32 224, ; 525
	i32 165, ; 526
	i32 257, ; 527
	i32 289, ; 528
	i32 100, ; 529
	i32 122, ; 530
	i32 228, ; 531
	i32 181, ; 532
	i32 160, ; 533
	i32 164, ; 534
	i32 231, ; 535
	i32 38, ; 536
	i32 189, ; 537
	i32 297, ; 538
	i32 17, ; 539
	i32 168, ; 540
	i32 310, ; 541
	i32 309, ; 542
	i32 202, ; 543
	i32 147, ; 544
	i32 220, ; 545
	i32 152, ; 546
	i32 129, ; 547
	i32 19, ; 548
	i32 64, ; 549
	i32 144, ; 550
	i32 46, ; 551
	i32 317, ; 552
	i32 206, ; 553
	i32 78, ; 554
	i32 60, ; 555
	i32 105, ; 556
	i32 255, ; 557
	i32 210, ; 558
	i32 48, ; 559
	i32 241, ; 560
	i32 314, ; 561
	i32 252, ; 562
	i32 14, ; 563
	i32 180, ; 564
	i32 67, ; 565
	i32 168, ; 566
	i32 320, ; 567
	i32 216, ; 568
	i32 220, ; 569
	i32 319, ; 570
	i32 77, ; 571
	i32 225, ; 572
	i32 107, ; 573
	i32 209, ; 574
	i32 251, ; 575
	i32 66, ; 576
	i32 62, ; 577
	i32 199, ; 578
	i32 157, ; 579
	i32 198, ; 580
	i32 218, ; 581
	i32 10, ; 582
	i32 189, ; 583
	i32 11, ; 584
	i32 77, ; 585
	i32 125, ; 586
	i32 82, ; 587
	i32 182, ; 588
	i32 65, ; 589
	i32 106, ; 590
	i32 64, ; 591
	i32 127, ; 592
	i32 121, ; 593
	i32 76, ; 594
	i32 266, ; 595
	i32 256, ; 596
	i32 318, ; 597
	i32 8, ; 598
	i32 224, ; 599
	i32 2, ; 600
	i32 43, ; 601
	i32 269, ; 602
	i32 153, ; 603
	i32 127, ; 604
	i32 254, ; 605
	i32 23, ; 606
	i32 132, ; 607
	i32 212, ; 608
	i32 243, ; 609
	i32 313, ; 610
	i32 295, ; 611
	i32 28, ; 612
	i32 211, ; 613
	i32 200, ; 614
	i32 61, ; 615
	i32 191, ; 616
	i32 89, ; 617
	i32 86, ; 618
	i32 145, ; 619
	i32 193, ; 620
	i32 35, ; 621
	i32 85, ; 622
	i32 232, ; 623
	i32 178, ; 624
	i32 308, ; 625
	i32 303, ; 626
	i32 181, ; 627
	i32 49, ; 628
	i32 6, ; 629
	i32 89, ; 630
	i32 315, ; 631
	i32 21, ; 632
	i32 159, ; 633
	i32 95, ; 634
	i32 49, ; 635
	i32 112, ; 636
	i32 248, ; 637
	i32 321, ; 638
	i32 129, ; 639
	i32 75, ; 640
	i32 199, ; 641
	i32 225, ; 642
	i32 247, ; 643
	i32 7, ; 644
	i32 190, ; 645
	i32 170, ; 646
	i32 109, ; 647
	i32 248, ; 648
	i32 234 ; 649
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
