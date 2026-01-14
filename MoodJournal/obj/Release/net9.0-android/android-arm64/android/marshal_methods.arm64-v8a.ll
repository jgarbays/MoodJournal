; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [383 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1149 x i64] [
	i64 u0x0010bf7088f76c5f, ; 0: Google.Cloud.Firestore.V1 => 185
	i64 u0x001e58127c546039, ; 1: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 2: Xamarin.KotlinX.Coroutines.Core.dll => 343
	i64 u0x0071cf2d27b7d61e, ; 3: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 294
	i64 u0x01109b0e4d99e61f, ; 4: System.ComponentModel.Annotations.dll => 13
	i64 u0x020f428300334897, ; 5: Grpc.Net.Client.dll => 192
	i64 u0x02123411c4e01926, ; 6: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 282
	i64 u0x0284512fad379f7e, ; 7: System.Runtime.Handles => 105
	i64 u0x02abedc11addc1ed, ; 8: lib_Mono.Android.Runtime.dll.so => 171
	i64 u0x02f55bf70672f5c8, ; 9: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 10: lib_Xamarin.AndroidX.AppCompat.dll.so => 234
	i64 u0x03621c804933a890, ; 11: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 12: lib_System.Private.DataContractSerialization.dll.so => 86
	i64 u0x043032f1d071fae0, ; 13: ru/Microsoft.Maui.Controls.resources => 372
	i64 u0x044440a55165631e, ; 14: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 350
	i64 u0x046eb1581a80c6b0, ; 15: vi/Microsoft.Maui.Controls.resources => 378
	i64 u0x047408741db2431a, ; 16: Xamarin.AndroidX.DynamicAnimation => 255
	i64 u0x04acae429ea0efac, ; 17: Xamarin.Grpc.Context => 332
	i64 u0x0517ef04e06e9f76, ; 18: System.Net.Primitives => 71
	i64 u0x051a3be159e4ef99, ; 19: Xamarin.GooglePlayServices.Tasks => 329
	i64 u0x0565d18c6da3de38, ; 20: Xamarin.AndroidX.RecyclerView => 286
	i64 u0x0581db89237110e9, ; 21: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 22: Microsoft.Maui.dll => 208
	i64 u0x05a1c25e78e22d87, ; 23: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 102
	i64 u0x06076b5d2b581f08, ; 24: zh-HK/Microsoft.Maui.Controls.resources => 379
	i64 u0x06388ffe9f6c161a, ; 25: System.Xml.Linq.dll => 156
	i64 u0x06600c4c124cb358, ; 26: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 27: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 260
	i64 u0x0680a433c781bb3d, ; 28: Xamarin.AndroidX.Collection.Jvm => 241
	i64 u0x069fff96ec92a91d, ; 29: System.Xml.XPath.dll => 161
	i64 u0x070b0847e18dab68, ; 30: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 257
	i64 u0x0739448d84d3b016, ; 31: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 298
	i64 u0x07469f2eecce9e85, ; 32: mscorlib.dll => 167
	i64 u0x07c57877c7ba78ad, ; 33: ru/Microsoft.Maui.Controls.resources.dll => 372
	i64 u0x07dcdc7460a0c5e4, ; 34: System.Collections.NonGeneric => 10
	i64 u0x08122e52765333c8, ; 35: lib_Microsoft.Extensions.Logging.Debug.dll.so => 203
	i64 u0x088610fc2509f69e, ; 36: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 299
	i64 u0x08a7c865576bbde7, ; 37: System.Reflection.Primitives => 96
	i64 u0x08c9d051a4a817e5, ; 38: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 252
	i64 u0x08f3c9788ee2153c, ; 39: Xamarin.AndroidX.DrawerLayout => 254
	i64 u0x09138715c92dba90, ; 40: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 41: lib_Microsoft.Extensions.Options.dll.so => 204
	i64 u0x092266563089ae3e, ; 42: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x098b50f911ccea8d, ; 43: lib_Xamarin.GooglePlayServices.Basement.dll.so => 325
	i64 u0x09d144a7e214d457, ; 44: System.Security.Cryptography => 127
	i64 u0x09da6dfc3439e851, ; 45: lib_Xamarin.Firebase.Components.dll.so => 308
	i64 u0x09e2b9f743db21a8, ; 46: lib_System.Reflection.Metadata.dll.so => 95
	i64 u0x0a066c5968b04c8d, ; 47: lib_Firebase.dll.so => 176
	i64 u0x0abb3e2b271edc45, ; 48: System.Threading.Channels.dll => 140
	i64 u0x0b06b1feab070143, ; 49: System.Formats.Tar => 39
	i64 u0x0b3b632c3bbee20c, ; 50: sk/Microsoft.Maui.Controls.resources => 373
	i64 u0x0b6aff547b84fbe9, ; 51: Xamarin.KotlinX.Serialization.Core.Jvm => 346
	i64 u0x0be2e1f8ce4064ed, ; 52: Xamarin.AndroidX.ViewPager => 301
	i64 u0x0c279376b1ae96ae, ; 53: lib_System.CodeDom.dll.so => 221
	i64 u0x0c3ca6cc978e2aae, ; 54: pt-BR/Microsoft.Maui.Controls.resources => 369
	i64 u0x0c59ad9fbbd43abe, ; 55: Mono.Android => 172
	i64 u0x0c65741e86371ee3, ; 56: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 228
	i64 u0x0c74af560004e816, ; 57: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 58: lib_Microsoft.Maui.Essentials.dll.so => 209
	i64 u0x0c83c82812e96127, ; 59: lib_System.Net.Mail.dll.so => 67
	i64 u0x0cce4bce83380b7f, ; 60: Xamarin.AndroidX.Security.SecurityCrypto => 291
	i64 u0x0d13cd7cce4284e4, ; 61: System.Security.SecureString => 130
	i64 u0x0d3b5ab8b2766190, ; 62: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 196
	i64 u0x0d565cb22b8879da, ; 63: lib_Grpc.Core.Api.dll.so => 191
	i64 u0x0d63f4f73521c24f, ; 64: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 290
	i64 u0x0e04e702012f8463, ; 65: Xamarin.AndroidX.Emoji2 => 256
	i64 u0x0e1489f4c773c237, ; 66: lib_MoodJournal.dll.so => 0
	i64 u0x0e14e73a54dda68e, ; 67: lib_System.Net.NameResolution.dll.so => 68
	i64 u0x0e5f1ca7132adebb, ; 68: Xamarin.Firebase.Installations.dll => 313
	i64 u0x0ec01b05613190b9, ; 69: SkiaSharp.Views.Android.dll => 216
	i64 u0x0f37dd7a62ae99af, ; 70: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 242
	i64 u0x0f5e7abaa7cf470a, ; 71: System.Net.HttpListener => 66
	i64 u0x1001f97bbe242e64, ; 72: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102861e4055f511a, ; 73: Microsoft.Bcl.AsyncInterfaces.dll => 196
	i64 u0x102a31b45304b1da, ; 74: Xamarin.AndroidX.CustomView => 251
	i64 u0x1065c4cb554c3d75, ; 75: System.IO.IsolatedStorage.dll => 52
	i64 u0x10f6cfcbcf801616, ; 76: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 77: System.Security.Cryptography.Primitives => 125
	i64 u0x11a603952763e1d4, ; 78: System.Net.Mail => 67
	i64 u0x11a70d0e1009fb11, ; 79: System.Net.WebSockets.dll => 81
	i64 u0x11f26371eee0d3c1, ; 80: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 271
	i64 u0x12128b3f59302d47, ; 81: lib_System.Xml.Serialization.dll.so => 158
	i64 u0x123639456fb056da, ; 82: System.Reflection.Emit.Lightweight.dll => 92
	i64 u0x12521e9764603eaa, ; 83: lib_System.Resources.Reader.dll.so => 99
	i64 u0x125b7f94acb989db, ; 84: Xamarin.AndroidX.RecyclerView.dll => 286
	i64 u0x12602de9d0de1ebb, ; 85: lib_Firebase.Storage.dll.so => 177
	i64 u0x12d3b63863d4ab0b, ; 86: lib_System.Threading.Overlapped.dll.so => 141
	i64 u0x12db68ac7e4d099f, ; 87: lib_Xamarin.Firebase.Iid.dll.so => 311
	i64 u0x12f23aabd624cf79, ; 88: lib_Google.Cloud.Firestore.V1.dll.so => 185
	i64 u0x134eab1061c395ee, ; 89: System.Transactions => 151
	i64 u0x138567fa954faa55, ; 90: Xamarin.AndroidX.Browser => 238
	i64 u0x13a01de0cbc3f06c, ; 91: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 356
	i64 u0x13beedefb0e28a45, ; 92: lib_System.Xml.XmlDocument.dll.so => 162
	i64 u0x13f1e5e209e91af4, ; 93: lib_Java.Interop.dll.so => 169
	i64 u0x13f1e880c25d96d1, ; 94: he/Microsoft.Maui.Controls.resources => 357
	i64 u0x1403071365bcd83a, ; 95: Xamarin.Firebase.Annotations => 305
	i64 u0x143d8ea60a6a4011, ; 96: Microsoft.Extensions.DependencyInjection.Abstractions => 200
	i64 u0x1497051b917530bd, ; 97: lib_System.Net.WebSockets.dll.so => 81
	i64 u0x14d612a531c79c05, ; 98: Xamarin.JSpecify.dll => 340
	i64 u0x14e68447938213b7, ; 99: Xamarin.AndroidX.Collection.Ktx.dll => 242
	i64 u0x152a448bd1e745a7, ; 100: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 101: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x15bdc156ed462f2f, ; 102: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 103: System.Resources.Writer.dll => 101
	i64 u0x16726eac78495e6d, ; 104: Xamarin.Grpc.Stub => 336
	i64 u0x16bf2a22df043a09, ; 105: System.IO.Pipes.dll => 56
	i64 u0x16c9d17b90a80fc1, ; 106: lib_Xamarin.Io.OpenCensus.OpenCensusApi.dll.so => 337
	i64 u0x16ea2b318ad2d830, ; 107: System.Security.Cryptography.Algorithms => 120
	i64 u0x16eeae54c7ebcc08, ; 108: System.Reflection.dll => 98
	i64 u0x17125c9a85b4929f, ; 109: lib_netstandard.dll.so => 168
	i64 u0x1716866f7416792e, ; 110: lib_System.Security.AccessControl.dll.so => 118
	i64 u0x174f71c46216e44a, ; 111: Xamarin.KotlinX.Coroutines.Core => 343
	i64 u0x1752c12f1e1fc00c, ; 112: System.Core => 21
	i64 u0x17b56e25558a5d36, ; 113: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 360
	i64 u0x17f9358913beb16a, ; 114: System.Text.Encodings.Web => 137
	i64 u0x1809fb23f29ba44a, ; 115: lib_System.Reflection.TypeExtensions.dll.so => 97
	i64 u0x18402a709e357f3b, ; 116: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 346
	i64 u0x18a9befae51bb361, ; 117: System.Net.WebClient => 77
	i64 u0x18f0ce884e87d89a, ; 118: nb/Microsoft.Maui.Controls.resources.dll => 366
	i64 u0x193d7a04b7eda8bc, ; 119: lib_Xamarin.AndroidX.Print.dll.so => 284
	i64 u0x19777fba3c41b398, ; 120: Xamarin.AndroidX.Startup.StartupRuntime.dll => 293
	i64 u0x19a4c090f14ebb66, ; 121: System.Security.Claims => 119
	i64 u0x1a539258f88190d6, ; 122: lib_System.Linq.Async.dll.so => 222
	i64 u0x1a91866a319e9259, ; 123: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 124: lib_System.dll.so => 165
	i64 u0x1aad60783ffa3e5b, ; 125: lib-th-Microsoft.Maui.Controls.resources.dll.so => 375
	i64 u0x1aea8f1c3b282172, ; 126: lib_System.Net.Ping.dll.so => 70
	i64 u0x1b4b7a1d0d265fa2, ; 127: Xamarin.Android.Glide.DiskLruCache => 227
	i64 u0x1bbdb16cfa73e785, ; 128: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 272
	i64 u0x1bc766e07b2b4241, ; 129: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 287
	i64 u0x1c753b5ff15bce1b, ; 130: Mono.Android.Runtime.dll => 171
	i64 u0x1cb6a0ededc839e2, ; 131: lib_Google.Apis.Auth.dll.so => 182
	i64 u0x1cd47467799d8250, ; 132: System.Threading.Tasks.dll => 145
	i64 u0x1d23eafdc6dc346c, ; 133: System.Globalization.Calendars.dll => 40
	i64 u0x1da4110562816681, ; 134: Xamarin.AndroidX.Security.SecurityCrypto.dll => 291
	i64 u0x1db6820994506bf5, ; 135: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dba6509cc55b56f, ; 136: lib_Google.Protobuf.dll.so => 188
	i64 u0x1dbb0c2c6a999acb, ; 137: System.Diagnostics.StackTrace => 30
	i64 u0x1dcda680b17dc5bb, ; 138: lib_Xamarin.Google.Guava.FailureAccess.dll.so => 322
	i64 u0x1e3d87657e9659bc, ; 139: Xamarin.AndroidX.Navigation.UI => 283
	i64 u0x1e71143913d56c10, ; 140: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 364
	i64 u0x1e7c31185e2fb266, ; 141: lib_System.Threading.Tasks.Parallel.dll.so => 144
	i64 u0x1ed8fcce5e9b50a0, ; 142: Microsoft.Extensions.Options.dll => 204
	i64 u0x1f055d15d807e1b2, ; 143: System.Xml.XmlSerializer => 163
	i64 u0x1f1ed22c1085f044, ; 144: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 145: lib_System.Numerics.dll.so => 84
	i64 u0x1f750bb5421397de, ; 146: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 295
	i64 u0x20237ea48006d7a8, ; 147: lib_System.Net.WebClient.dll.so => 77
	i64 u0x209375905fcc1bad, ; 148: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20e085517023eec8, ; 149: lib_Google.Api.Gax.dll.so => 179
	i64 u0x20fab3cf2dfbc8df, ; 150: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 151: System.Globalization => 42
	i64 u0x21419508838f7547, ; 152: System.Runtime.CompilerServices.VisualC => 103
	i64 u0x2174319c0d835bc9, ; 153: System.Runtime => 117
	i64 u0x21846dffb992e05b, ; 154: lib_Microcharts.Maui.dll.so => 195
	i64 u0x218ae22aa3ec33e7, ; 155: Xamarin.Grpc.Protobuf.Lite.dll => 335
	i64 u0x2198e5bc8b7153fa, ; 156: Xamarin.AndroidX.Annotation.Experimental.dll => 232
	i64 u0x219ea1b751a4dee4, ; 157: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 158: System.Reflection.Emit.ILGeneration => 91
	i64 u0x220fd4f2e7c48170, ; 159: th/Microsoft.Maui.Controls.resources => 375
	i64 u0x224538d85ed15a82, ; 160: System.IO.Pipes => 56
	i64 u0x22668b177c6cedef, ; 161: Plugin.Maui.Calendar.dll => 214
	i64 u0x22908438c6bed1af, ; 162: lib_System.Threading.Timer.dll.so => 148
	i64 u0x2347c268e3e4e536, ; 163: Xamarin.GooglePlayServices.Basement.dll => 325
	i64 u0x237be844f1f812c7, ; 164: System.Threading.Thread.dll => 146
	i64 u0x23852b3bdc9f7096, ; 165: System.Resources.ResourceManager => 100
	i64 u0x23986dd7e5d4fc01, ; 166: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x23b0dd507a933aa9, ; 167: Google.Api.Gax => 179
	i64 u0x2407aef2bbe8fadf, ; 168: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 169: Xamarin.AndroidX.Core.dll => 247
	i64 u0x247619fe4413f8bf, ; 170: System.Runtime.Serialization.Primitives.dll => 114
	i64 u0x24b87318591adabe, ; 171: lib_Xamarin.Firebase.Database.Collection.dll.so => 309
	i64 u0x24b95d581a70fbee, ; 172: Grpc.Auth.dll => 190
	i64 u0x24d4238047d7310f, ; 173: Google.Apis.Auth => 182
	i64 u0x24de8d301281575e, ; 174: Xamarin.Android.Glide => 225
	i64 u0x252073cc3caa62c2, ; 175: fr/Microsoft.Maui.Controls.resources.dll => 356
	i64 u0x256b8d41255f01b1, ; 176: Xamarin.Google.Crypto.Tink.Android => 318
	i64 u0x2662c629b96b0b30, ; 177: lib_Xamarin.Kotlin.StdLib.dll.so => 341
	i64 u0x268c1439f13bcc29, ; 178: lib_Microsoft.Extensions.Primitives.dll.so => 205
	i64 u0x26918e5f13c8fc7c, ; 179: Xamarin.Firebase.Firestore => 310
	i64 u0x26a670e154a9c54b, ; 180: System.Reflection.Extensions.dll => 94
	i64 u0x26d077d9678fe34f, ; 181: System.IO.dll => 58
	i64 u0x273f3515de5faf0d, ; 182: id/Microsoft.Maui.Controls.resources.dll => 361
	i64 u0x2742545f9094896d, ; 183: hr/Microsoft.Maui.Controls.resources => 359
	i64 u0x2759af78ab94d39b, ; 184: System.Net.WebSockets => 81
	i64 u0x27b2b16f3e9de038, ; 185: Xamarin.Google.Crypto.Tink.Android.dll => 318
	i64 u0x27b410442fad6cf1, ; 186: Java.Interop.dll => 169
	i64 u0x27b97e0d52c3034a, ; 187: System.Diagnostics.Debug => 26
	i64 u0x27c1227907352196, ; 188: lib_Xamarin.Firebase.Installations.InterOp.dll.so => 314
	i64 u0x27d88445c936a1af, ; 189: lib_Xamarin.Grpc.Android.dll.so => 330
	i64 u0x2801845a2c71fbfb, ; 190: System.Net.Primitives.dll => 71
	i64 u0x28457a8c23b2a129, ; 191: Xamarin.Firebase.Iid => 311
	i64 u0x286835e259162700, ; 192: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 285
	i64 u0x2881244d3aa6b873, ; 193: Plugin.Maui.Calendar => 214
	i64 u0x2927d345f3daec35, ; 194: SkiaSharp.dll => 215
	i64 u0x2949f3617a02c6b2, ; 195: Xamarin.AndroidX.ExifInterface => 258
	i64 u0x2a128783efe70ba0, ; 196: uk/Microsoft.Maui.Controls.resources.dll => 377
	i64 u0x2a3b095612184159, ; 197: lib_System.Net.NetworkInformation.dll.so => 69
	i64 u0x2a6507a5ffabdf28, ; 198: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad156c8e1354139, ; 199: fi/Microsoft.Maui.Controls.resources => 355
	i64 u0x2ad5d6b13b7a3e04, ; 200: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 201: System.Text.RegularExpressions.dll => 139
	i64 u0x2afc1c4f898552ee, ; 202: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b0f316f4c87d83a, ; 203: Xamarin.Io.OpenCensus.OpenCensusApi => 337
	i64 u0x2b148910ed40fbf9, ; 204: zh-Hant/Microsoft.Maui.Controls.resources.dll => 381
	i64 u0x2b6989d78cba9a15, ; 205: Xamarin.AndroidX.Concurrent.Futures.dll => 243
	i64 u0x2c8bd14bb93a7d82, ; 206: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 368
	i64 u0x2cbd9262ca785540, ; 207: lib_System.Text.Encoding.CodePages.dll.so => 134
	i64 u0x2cc9e1fed6257257, ; 208: lib_System.Reflection.Emit.Lightweight.dll.so => 92
	i64 u0x2cd723e9fe623c7c, ; 209: lib_System.Private.Xml.Linq.dll.so => 88
	i64 u0x2d169d318a968379, ; 210: System.Threading.dll => 149
	i64 u0x2d1d1413dd10c597, ; 211: Xamarin.Google.Guava.FailureAccess => 322
	i64 u0x2d47774b7d993f59, ; 212: sv/Microsoft.Maui.Controls.resources.dll => 374
	i64 u0x2d5ffcae1ad0aaca, ; 213: System.Data.dll => 24
	i64 u0x2d6267ac7de1d619, ; 214: Xamarin.Firebase.Database.Collection.dll => 309
	i64 u0x2db915caf23548d2, ; 215: System.Text.Json.dll => 138
	i64 u0x2dcaa0bb15a4117a, ; 216: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e5a40c319acb800, ; 217: System.IO.FileSystem => 51
	i64 u0x2e6f1f226821322a, ; 218: el/Microsoft.Maui.Controls.resources.dll => 353
	i64 u0x2f02f94df3200fe5, ; 219: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 220: System.Xml.ReaderWriter => 157
	i64 u0x2f5911d9ba814e4e, ; 221: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 222: lib_System.Xml.dll.so => 164
	i64 u0x2fd92a71c7638cfd, ; 223: Xamarin.Firebase.Database.Collection => 309
	i64 u0x301713b5054e4388, ; 224: Xamarin.GooglePlayServices.Stats.dll => 328
	i64 u0x309ee9eeec09a71e, ; 225: lib_Xamarin.AndroidX.Fragment.dll.so => 259
	i64 u0x30c6dda129408828, ; 226: System.IO.IsolatedStorage => 52
	i64 u0x30ff0edf3d280bcd, ; 227: Firebase.Auth => 175
	i64 u0x31195fef5d8fb552, ; 228: _Microsoft.Android.Resource.Designer.dll => 382
	i64 u0x312c8ed623cbfc8d, ; 229: Xamarin.AndroidX.Window.dll => 303
	i64 u0x31496b779ed0663d, ; 230: lib_System.Reflection.DispatchProxy.dll.so => 90
	i64 u0x315f08d19390dc36, ; 231: Xamarin.Google.ErrorProne.TypeAnnotations => 320
	i64 u0x32243413e774362a, ; 232: Xamarin.AndroidX.CardView.dll => 239
	i64 u0x3235427f8d12dae1, ; 233: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x326256f7722d4fe5, ; 234: SkiaSharp.Views.Maui.Controls.dll => 217
	i64 u0x329753a17a517811, ; 235: fr/Microsoft.Maui.Controls.resources => 356
	i64 u0x32aa989ff07a84ff, ; 236: lib_System.Xml.ReaderWriter.dll.so => 157
	i64 u0x33829542f112d59b, ; 237: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 238: lib-es-Microsoft.Maui.Controls.resources.dll.so => 354
	i64 u0x33ec63a7e226adfb, ; 239: Google.Cloud.Location.dll => 186
	i64 u0x341abc357fbb4ebf, ; 240: lib_System.Net.Sockets.dll.so => 76
	i64 u0x342397b849d48e49, ; 241: Xamarin.Grpc.Core => 333
	i64 u0x3496c1e2dcaf5ecc, ; 242: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x34dfd74fe2afcf37, ; 243: Microsoft.Maui => 208
	i64 u0x34e292762d9615df, ; 244: cs/Microsoft.Maui.Controls.resources.dll => 350
	i64 u0x35080e71f38b333d, ; 245: Xamarin.Protobuf.Lite => 347
	i64 u0x3508234247f48404, ; 246: Microsoft.Maui.Controls => 206
	i64 u0x353590da528c9d22, ; 247: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 248: lib_Xamarin.AndroidX.ViewPager2.dll.so => 302
	i64 u0x355282fc1c909694, ; 249: Microsoft.Extensions.Configuration => 197
	i64 u0x3552fc5d578f0fbf, ; 250: Xamarin.AndroidX.Arch.Core.Common => 236
	i64 u0x355c649948d55d97, ; 251: lib_System.Runtime.Intrinsics.dll.so => 109
	i64 u0x356fd122ba041cb4, ; 252: lib_Xamarin.Grpc.Protobuf.Lite.dll.so => 335
	i64 u0x35ea9d1c6834bc8c, ; 253: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 275
	i64 u0x3628ab68db23a01a, ; 254: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x364703ab05867b92, ; 255: Xamarin.Firebase.Components => 308
	i64 u0x3673b042508f5b6b, ; 256: lib_System.Runtime.Extensions.dll.so => 104
	i64 u0x36740f1a8ecdc6c4, ; 257: System.Numerics => 84
	i64 u0x36b2b50fdf589ae2, ; 258: System.Reflection.Emit.Lightweight => 92
	i64 u0x36cada77dc79928b, ; 259: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 260: System.Reflection.Primitives.dll => 96
	i64 u0x376bf93e521a5417, ; 261: lib_Xamarin.Jetbrains.Annotations.dll.so => 339
	i64 u0x379e6c338e5508ad, ; 262: lib_Google.Api.Gax.Grpc.dll.so => 180
	i64 u0x37bc29f3183003b6, ; 263: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 264: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 265: System.Runtime.CompilerServices.Unsafe => 102
	i64 u0x385c17636bb6fe6e, ; 266: Xamarin.AndroidX.CustomView.dll => 251
	i64 u0x38869c811d74050e, ; 267: System.Net.NameResolution.dll => 68
	i64 u0x3889cbdca0f2c57c, ; 268: Xamarin.GooglePlayServices.Location.dll => 327
	i64 u0x393c226616977fdb, ; 269: lib_Xamarin.AndroidX.ViewPager.dll.so => 301
	i64 u0x395b3053dde89e41, ; 270: lib_System.Reactive.dll.so => 224
	i64 u0x395e37c3334cf82a, ; 271: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 349
	i64 u0x39a87563fdb248a0, ; 272: System.Reactive.dll => 224
	i64 u0x39aa39fda111d9d3, ; 273: Newtonsoft.Json => 211
	i64 u0x3ab5859054645f72, ; 274: System.Security.Cryptography.Primitives.dll => 125
	i64 u0x3ad75090c3fac0e9, ; 275: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 287
	i64 u0x3ae44ac43a1fbdbb, ; 276: System.Runtime.Serialization => 116
	i64 u0x3b860f9932505633, ; 277: lib_System.Text.Encoding.Extensions.dll.so => 135
	i64 u0x3be99b43dd39dd37, ; 278: Xamarin.AndroidX.SavedState.SavedState.Android => 289
	i64 u0x3c3aafb6b3a00bf6, ; 279: lib_System.Security.Cryptography.X509Certificates.dll.so => 126
	i64 u0x3c4049146b59aa90, ; 280: System.Runtime.InteropServices.JavaScript => 106
	i64 u0x3c51334447dec9e7, ; 281: Google.LongRunning => 187
	i64 u0x3c7c495f58ac5ee9, ; 282: Xamarin.Kotlin.StdLib => 341
	i64 u0x3c7e5ed3d5db71bb, ; 283: System.Security => 131
	i64 u0x3c90a7b70f45292a, ; 284: Xamarin.Grpc.OkHttp.dll => 334
	i64 u0x3cc1676a8781bdbc, ; 285: Xamarin.Firebase.Auth.Interop.dll => 306
	i64 u0x3cd9d281d402eb9b, ; 286: Xamarin.AndroidX.Browser.dll => 238
	i64 u0x3d1c50cc001a991e, ; 287: Xamarin.Google.Guava.ListenableFuture.dll => 323
	i64 u0x3d2b1913edfc08d7, ; 288: lib_System.Threading.ThreadPool.dll.so => 147
	i64 u0x3d46f0b995082740, ; 289: System.Xml.Linq => 156
	i64 u0x3d8a8f400514a790, ; 290: Xamarin.AndroidX.Fragment.Ktx.dll => 260
	i64 u0x3d9c2a242b040a50, ; 291: lib_Xamarin.AndroidX.Core.dll.so => 247
	i64 u0x3daa14724d8f58e8, ; 292: Google.Protobuf.dll => 188
	i64 u0x3dbb6b9f5ab90fa7, ; 293: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 255
	i64 u0x3e027e6e728d7f1c, ; 294: Google.LongRunning.dll => 187
	i64 u0x3e5441657549b213, ; 295: Xamarin.AndroidX.ResourceInspection.Annotation => 287
	i64 u0x3e57d4d195c53c2e, ; 296: System.Reflection.TypeExtensions => 97
	i64 u0x3e616ab4ed1f3f15, ; 297: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 298: Xamarin.AndroidX.SlidingPaneLayout.dll => 292
	i64 u0x3f2839b8d63653b8, ; 299: lib_LiteDB.dll.so => 194
	i64 u0x3f510adf788828dd, ; 300: System.Threading.Tasks.Extensions => 143
	i64 u0x407740ff2e914d86, ; 301: Xamarin.AndroidX.Print.dll => 284
	i64 u0x407a10bb4bf95829, ; 302: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 280
	i64 u0x40c6d9cbfdb8b9f7, ; 303: SkiaSharp.Views.Maui.Core.dll => 218
	i64 u0x40c98b6bd77346d4, ; 304: Microsoft.VisualBasic.dll => 3
	i64 u0x41406d6f37320d99, ; 305: Google.Api.Gax.Grpc.dll => 180
	i64 u0x41833cf766d27d96, ; 306: mscorlib => 167
	i64 u0x41cab042be111c34, ; 307: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 235
	i64 u0x423a9ecc4d905a88, ; 308: lib_System.Resources.ResourceManager.dll.so => 100
	i64 u0x423bf51ae7def810, ; 309: System.Xml.XPath => 161
	i64 u0x42418aba44539ffd, ; 310: Google.Cloud.Firestore => 184
	i64 u0x42462ff15ddba223, ; 311: System.Resources.Reader.dll => 99
	i64 u0x4266c67fd9a4ee79, ; 312: Google.Api.CommonProtos => 178
	i64 u0x4291015ff4e5ef71, ; 313: Xamarin.AndroidX.Core.ViewTree.dll => 249
	i64 u0x42a31b86e6ccc3f0, ; 314: System.Diagnostics.Contracts => 25
	i64 u0x42d3cd7add035099, ; 315: System.Management.dll => 223
	i64 u0x430e95b891249788, ; 316: lib_System.Reflection.Emit.dll.so => 93
	i64 u0x43375950ec7c1b6a, ; 317: netstandard.dll => 168
	i64 u0x434c4e1d9284cdae, ; 318: Mono.Android.dll => 172
	i64 u0x43505013578652a0, ; 319: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 230
	i64 u0x437d06c381ed575a, ; 320: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 321: pl/Microsoft.Maui.Controls.resources.dll => 368
	i64 u0x43c077442b230f64, ; 322: Xamarin.AndroidX.Tracing.Tracing.Android => 296
	i64 u0x43e8ca5bc927ff37, ; 323: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 257
	i64 u0x448bd33429269b19, ; 324: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 325: lib_System.Runtime.Serialization.Primitives.dll.so => 114
	i64 u0x4515080865a951a5, ; 326: Xamarin.Kotlin.StdLib.dll => 341
	i64 u0x4545802489b736b9, ; 327: Xamarin.AndroidX.Fragment.Ktx => 260
	i64 u0x454b4d1e66bb783c, ; 328: Xamarin.AndroidX.Lifecycle.Process => 268
	i64 u0x45b31d67ff6f2b8a, ; 329: lib_Google.Apis.dll.so => 181
	i64 u0x45c40276a42e283e, ; 330: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 331: System.AppContext.dll => 6
	i64 u0x46a4213bc97fe5ae, ; 332: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 372
	i64 u0x46f84b5cc9b7d78b, ; 333: Xamarin.Io.OpenCensus.OpenCensusContribGrpcMetrics.dll => 338
	i64 u0x47358bd471172e1d, ; 334: lib_System.Xml.Linq.dll.so => 156
	i64 u0x4747e19ad6a1d4bb, ; 335: Grpc.Net.Common => 193
	i64 u0x47daf4e1afbada10, ; 336: pt/Microsoft.Maui.Controls.resources => 370
	i64 u0x480c0a47dd42dd81, ; 337: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x488d293220a4fe37, ; 338: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 262
	i64 u0x49e952f19a4e2022, ; 339: System.ObjectModel => 85
	i64 u0x49f6ab815e178ca9, ; 340: lib_Xamarin.Firebase.Common.dll.so => 307
	i64 u0x49f9e6948a8131e4, ; 341: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 300
	i64 u0x4a0fc182a3c7fc42, ; 342: Xamarin.Protobuf.Lite.dll => 347
	i64 u0x4a5667b2462a664b, ; 343: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 283
	i64 u0x4a7a18981dbd56bc, ; 344: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4aa5c60350917c06, ; 345: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 267
	i64 u0x4b07a0ed0ab33ff4, ; 346: System.Runtime.Extensions.dll => 104
	i64 u0x4b576d47ac054f3c, ; 347: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 348: System.Text.Json => 138
	i64 u0x4bf547f87e5016a8, ; 349: lib_SkiaSharp.Views.Android.dll.so => 216
	i64 u0x4c2029a97af23a8d, ; 350: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android => 277
	i64 u0x4c7755cf07ad2d5f, ; 351: System.Net.Http.Json.dll => 64
	i64 u0x4cc5f15266470798, ; 352: lib_Xamarin.AndroidX.Loader.dll.so => 278
	i64 u0x4cf6f67dc77aacd2, ; 353: System.Net.NetworkInformation.dll => 69
	i64 u0x4d3183dd245425d4, ; 354: System.Net.WebSockets.Client.dll => 80
	i64 u0x4d479f968a05e504, ; 355: System.Linq.Expressions.dll => 59
	i64 u0x4d55a010ffc4faff, ; 356: System.Private.Xml => 89
	i64 u0x4d5cbe77561c5b2e, ; 357: System.Web.dll => 154
	i64 u0x4d77512dbd86ee4c, ; 358: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 236
	i64 u0x4d7793536e79c309, ; 359: System.ServiceProcess => 133
	i64 u0x4d95fccc1f67c7ca, ; 360: System.Runtime.Loader.dll => 110
	i64 u0x4dcf44c3c9b076a2, ; 361: it/Microsoft.Maui.Controls.resources.dll => 362
	i64 u0x4dd9247f1d2c3235, ; 362: Xamarin.AndroidX.Loader.dll => 278
	i64 u0x4e2aeee78e2c4a87, ; 363: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 285
	i64 u0x4e32f00cb0937401, ; 364: Mono.Android.Runtime => 171
	i64 u0x4e5eea4668ac2b18, ; 365: System.Text.Encoding.CodePages => 134
	i64 u0x4ebd0c4b82c5eefc, ; 366: lib_System.Threading.Channels.dll.so => 140
	i64 u0x4ee8eaa9c9c1151a, ; 367: System.Globalization.Calendars => 40
	i64 u0x4f21ee6ef9eb527e, ; 368: ca/Microsoft.Maui.Controls.resources => 349
	i64 u0x4ff8ea8951a69b9f, ; 369: Xamarin.Grpc.Android.dll => 330
	i64 u0x5037f0be3c28c7a3, ; 370: lib_Microsoft.Maui.Controls.dll.so => 206
	i64 u0x508c1fa6b57728d9, ; 371: Grpc.Net.Common.dll => 193
	i64 u0x50bd8cfae0f07500, ; 372: lib_Xamarin.GooglePlayServices.Stats.dll.so => 328
	i64 u0x50bf7f8c65d00454, ; 373: Firebase.Storage => 177
	i64 u0x50c3a29b21050d45, ; 374: System.Linq.Parallel.dll => 60
	i64 u0x5112ed116d87baf8, ; 375: CommunityToolkit.Mvvm => 174
	i64 u0x5131bbe80989093f, ; 376: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 274
	i64 u0x515d61d6527dac70, ; 377: lib_Xamarin.Firebase.Auth.Interop.dll.so => 306
	i64 u0x516324a5050a7e3c, ; 378: System.Net.WebProxy => 79
	i64 u0x516d6f0b21a303de, ; 379: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 380: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 381: System.Resources.Reader => 99
	i64 u0x526bb15e3c386364, ; 382: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 271
	i64 u0x526ce79eb8e90527, ; 383: lib_System.Net.Primitives.dll.so => 71
	i64 u0x5277169428c6ebf6, ; 384: lib_Grpc.Net.Common.dll.so => 193
	i64 u0x52829f00b4467c38, ; 385: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 386: Xamarin.AndroidX.Core => 247
	i64 u0x52ff996554dbf352, ; 387: Microsoft.Maui.Graphics => 210
	i64 u0x535f7e40e8fef8af, ; 388: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 373
	i64 u0x53978aac584c666e, ; 389: lib_System.Security.Cryptography.Cng.dll.so => 121
	i64 u0x53a96d5c86c9e194, ; 390: System.Net.NetworkInformation => 69
	i64 u0x53be1038a61e8d44, ; 391: System.Runtime.InteropServices.RuntimeInformation.dll => 107
	i64 u0x53c3014b9437e684, ; 392: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 379
	i64 u0x53e450ebd586f842, ; 393: lib_Xamarin.AndroidX.LocalBroadcastManager.dll.so => 279
	i64 u0x5435e6f049e9bc37, ; 394: System.Security.Claims.dll => 119
	i64 u0x54795225dd1587af, ; 395: lib_System.Runtime.dll.so => 117
	i64 u0x547a34f14e5f6210, ; 396: Xamarin.AndroidX.Lifecycle.Common.dll => 263
	i64 u0x54b42cc2b8e65a84, ; 397: Google.Apis.Core.dll => 183
	i64 u0x556e8b63b660ab8b, ; 398: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 264
	i64 u0x5588627c9a108ec9, ; 399: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 400: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 401: lib_System.Security.Cryptography.OpenSsl.dll.so => 124
	i64 u0x561449e1215a61e4, ; 402: lib_SkiaSharp.Views.Maui.Core.dll.so => 218
	i64 u0x56442b99bc64bb47, ; 403: System.Runtime.Serialization.Xml.dll => 115
	i64 u0x56a8b26e1aeae27b, ; 404: System.Threading.Tasks.Dataflow => 142
	i64 u0x56f932d61e93c07f, ; 405: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 406: System.Private.Uri => 87
	i64 u0x57201164aeb974e3, ; 407: Xamarin.Google.Guava.FailureAccess.dll => 322
	i64 u0x576499c9f52fea31, ; 408: Xamarin.AndroidX.Annotation => 231
	i64 u0x579a06fed6eec900, ; 409: System.Private.CoreLib.dll => 173
	i64 u0x57c542c14049b66d, ; 410: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 411: System.Threading.Timer => 148
	i64 u0x58601b2dda4a27b9, ; 412: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 363
	i64 u0x58688d9af496b168, ; 413: Microsoft.Extensions.DependencyInjection.dll => 199
	i64 u0x588c167a79db6bfb, ; 414: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 319
	i64 u0x5906028ae5151104, ; 415: Xamarin.AndroidX.Activity.Ktx => 230
	i64 u0x595a356d23e8da9a, ; 416: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59a935a032dbc08c, ; 417: lib_Grpc.Auth.dll.so => 190
	i64 u0x59f9e60b9475085f, ; 418: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 232
	i64 u0x5a6dc081b000c5d7, ; 419: lib_Xamarin.Grpc.OkHttp.dll.so => 334
	i64 u0x5a745f5101a75527, ; 420: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a89a886ae30258d, ; 421: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 246
	i64 u0x5a8f6699f4a1caa9, ; 422: lib_System.Threading.dll.so => 149
	i64 u0x5ae8e4f3eae4d547, ; 423: Xamarin.AndroidX.Legacy.Support.Core.Utils => 262
	i64 u0x5ae9cd33b15841bf, ; 424: System.ComponentModel => 18
	i64 u0x5aeb8cd498d4823e, ; 425: lib_Xamarin.Google.Guava.dll.so => 321
	i64 u0x5b54391bdc6fcfe6, ; 426: System.Private.DataContractSerialization => 86
	i64 u0x5b5ba1327561f926, ; 427: lib_SkiaSharp.Views.Maui.Controls.dll.so => 217
	i64 u0x5b5f0e240a06a2a2, ; 428: da/Microsoft.Maui.Controls.resources.dll => 351
	i64 u0x5b755276902c8414, ; 429: Xamarin.GooglePlayServices.Base => 324
	i64 u0x5b8109e8e14c5e3e, ; 430: System.Globalization.Extensions.dll => 41
	i64 u0x5bddd04d72a9e350, ; 431: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 267
	i64 u0x5bdf16b09da116ab, ; 432: Xamarin.AndroidX.Collection => 240
	i64 u0x5c019d5266093159, ; 433: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 272
	i64 u0x5c30a4a35f9cc8c4, ; 434: lib_System.Reflection.Extensions.dll.so => 94
	i64 u0x5c393624b8176517, ; 435: lib_Microsoft.Extensions.Logging.dll.so => 201
	i64 u0x5c53c29f5073b0c9, ; 436: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 437: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 438: System.Net.WebHeaderCollection.dll => 78
	i64 u0x5d40c9b15181641f, ; 439: lib_Xamarin.AndroidX.Emoji2.dll.so => 256
	i64 u0x5d6ca10d35e9485b, ; 440: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 243
	i64 u0x5d7ec76c1c703055, ; 441: System.Threading.Tasks.Parallel => 144
	i64 u0x5db0cbbd1028510e, ; 442: lib_System.Runtime.InteropServices.dll.so => 108
	i64 u0x5db30905d3e5013b, ; 443: Xamarin.AndroidX.Collection.Jvm.dll => 241
	i64 u0x5dd10b96620cce23, ; 444: Xamarin.Firebase.Iid.Interop => 312
	i64 u0x5e467bc8f09ad026, ; 445: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 446: System.Runtime.Handles.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 447: System.Text.Encodings.Web.dll => 137
	i64 u0x5eb8046dd40e9ac3, ; 448: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 449: System.Security.Cryptography.Csp.dll => 122
	i64 u0x5eee1376d94c7f5e, ; 450: System.Net.HttpListener.dll => 66
	i64 u0x5f36ccf5c6a57e24, ; 451: System.Xml.ReaderWriter.dll => 157
	i64 u0x5f4294b9b63cb842, ; 452: System.Data.Common => 22
	i64 u0x5f9a2d823f664957, ; 453: lib-el-Microsoft.Maui.Controls.resources.dll.so => 353
	i64 u0x5fa6da9c3cd8142a, ; 454: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 345
	i64 u0x5fac98e0b37a5b9d, ; 455: System.Runtime.CompilerServices.Unsafe.dll => 102
	i64 u0x609f4b7b63d802d4, ; 456: lib_Microsoft.Extensions.DependencyInjection.dll.so => 199
	i64 u0x60cd4e33d7e60134, ; 457: Xamarin.KotlinX.Coroutines.Core.Jvm => 344
	i64 u0x60ee72f71c4b3113, ; 458: Xamarin.Firebase.Iid.Interop.dll => 312
	i64 u0x60f62d786afcf130, ; 459: System.Memory => 63
	i64 u0x61bb78c89f867353, ; 460: System.IO => 58
	i64 u0x61be8d1299194243, ; 461: Microsoft.Maui.Controls.Xaml => 207
	i64 u0x61d2cba29557038f, ; 462: de/Microsoft.Maui.Controls.resources => 352
	i64 u0x61d88f399afb2f45, ; 463: lib_System.Runtime.Loader.dll.so => 110
	i64 u0x622eef6f9e59068d, ; 464: System.Private.CoreLib => 173
	i64 u0x62e976fd765a2339, ; 465: Xamarin.Firebase.Auth.Interop => 306
	i64 u0x63982c87366f9be8, ; 466: Xamarin.Google.Guava => 321
	i64 u0x63d5e3aa4ef9b931, ; 467: Xamarin.KotlinX.Coroutines.Android.dll => 342
	i64 u0x63f1f6883c1e23c2, ; 468: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 469: Xamarin.Google.Android.Material.dll => 316
	i64 u0x640e3b14dbd325c2, ; 470: System.Security.Cryptography.Algorithms.dll => 120
	i64 u0x64587004560099b9, ; 471: System.Reflection => 98
	i64 u0x64b1529a438a3c45, ; 472: lib_System.Runtime.Handles.dll.so => 105
	i64 u0x6565fba2cd8f235b, ; 473: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 275
	i64 u0x65ca90e07a453071, ; 474: Microcharts.Maui.dll => 195
	i64 u0x65ecac39144dd3cc, ; 475: Microsoft.Maui.Controls.dll => 206
	i64 u0x65ece51227bfa724, ; 476: lib_System.Runtime.Numerics.dll.so => 111
	i64 u0x661722438787b57f, ; 477: Xamarin.AndroidX.Annotation.Jvm.dll => 233
	i64 u0x6679b2337ee6b22a, ; 478: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x6692e924eade1b29, ; 479: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 480: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 274
	i64 u0x66d13304ce1a3efa, ; 481: Xamarin.AndroidX.CursorAdapter => 250
	i64 u0x674303f65d8fad6f, ; 482: lib_System.Net.Quic.dll.so => 72
	i64 u0x6756ca4cad62e9d6, ; 483: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 245
	i64 u0x67c0802770244408, ; 484: System.Windows.dll => 155
	i64 u0x68100b69286e27cd, ; 485: lib_System.Formats.Tar.dll.so => 39
	i64 u0x68558ec653afa616, ; 486: lib-da-Microsoft.Maui.Controls.resources.dll.so => 351
	i64 u0x6872ec7a2e36b1ac, ; 487: System.Drawing.Primitives.dll => 35
	i64 u0x68fbbbe2eb455198, ; 488: System.Formats.Asn1 => 38
	i64 u0x69063fc0ba8e6bdd, ; 489: he/Microsoft.Maui.Controls.resources.dll => 357
	i64 u0x69a3e26c76f6eec4, ; 490: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 304
	i64 u0x6a4d7577b2317255, ; 491: System.Runtime.InteropServices.dll => 108
	i64 u0x6ab05716e0ac384b, ; 492: LiteDB.dll => 194
	i64 u0x6ace3b74b15ee4a4, ; 493: nb/Microsoft.Maui.Controls.resources => 366
	i64 u0x6afcedb171067e2b, ; 494: System.Core.dll => 21
	i64 u0x6b2b13561049ea2c, ; 495: lib_Xamarin.Protobuf.Lite.dll.so => 347
	i64 u0x6bc822f45373a1d6, ; 496: Google.Apis.dll => 181
	i64 u0x6bef98e124147c24, ; 497: Xamarin.Jetbrains.Annotations => 339
	i64 u0x6c07f7c8a4a1e99d, ; 498: LiteDB => 194
	i64 u0x6ce874bff138ce2b, ; 499: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 273
	i64 u0x6d12bfaa99c72b1f, ; 500: lib_Microsoft.Maui.Graphics.dll.so => 210
	i64 u0x6d70755158ca866e, ; 501: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 502: Microsoft.Extensions.Primitives => 205
	i64 u0x6d7eeca99577fc8b, ; 503: lib_System.Net.WebProxy.dll.so => 79
	i64 u0x6d8515b19946b6a2, ; 504: System.Net.WebProxy.dll => 79
	i64 u0x6d86d56b84c8eb71, ; 505: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 250
	i64 u0x6d9bea6b3e895cf7, ; 506: Microsoft.Extensions.Primitives.dll => 205
	i64 u0x6dd9bf4083de3f6a, ; 507: Xamarin.AndroidX.DocumentFile.dll => 253
	i64 u0x6e25a02c3833319a, ; 508: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 281
	i64 u0x6e79c6bd8627412a, ; 509: Xamarin.AndroidX.SavedState.SavedState.Ktx => 290
	i64 u0x6e838d9a2a6f6c9e, ; 510: lib_System.ValueTuple.dll.so => 152
	i64 u0x6e9965ce1095e60a, ; 511: lib_System.Core.dll.so => 21
	i64 u0x6f304d1dec1019e9, ; 512: lib_Xamarin.Firebase.Installations.dll.so => 313
	i64 u0x6fd2265da78b93a4, ; 513: lib_Microsoft.Maui.dll.so => 208
	i64 u0x6fdfc7de82c33008, ; 514: cs/Microsoft.Maui.Controls.resources => 350
	i64 u0x6ffc4967cc47ba57, ; 515: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 516: System.IO.FileSystem.dll => 51
	i64 u0x70664ad3307f4fbf, ; 517: Xamarin.Grpc.Core.dll => 333
	i64 u0x70e99f48c05cb921, ; 518: tr/Microsoft.Maui.Controls.resources.dll => 376
	i64 u0x70fb7a3521043a40, ; 519: Plugin.CloudFirestore => 212
	i64 u0x70fd3deda22442d2, ; 520: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 366
	i64 u0x71485e7ffdb4b958, ; 521: System.Reflection.Extensions => 94
	i64 u0x7162a2fce67a945f, ; 522: lib_Xamarin.Android.Glide.Annotations.dll.so => 226
	i64 u0x71a495ea3761dde8, ; 523: lib-it-Microsoft.Maui.Controls.resources.dll.so => 362
	i64 u0x71ad672adbe48f35, ; 524: System.ComponentModel.Primitives.dll => 16
	i64 u0x720f102581a4a5c8, ; 525: Xamarin.AndroidX.Core.ViewTree => 249
	i64 u0x725f5a9e82a45c81, ; 526: System.Security.Cryptography.Encoding => 123
	i64 u0x72b1fb4109e08d7b, ; 527: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 359
	i64 u0x72e0300099accce1, ; 528: System.Xml.XPath.XDocument => 160
	i64 u0x730bfb248998f67a, ; 529: System.IO.Compression.ZipFile => 45
	i64 u0x732b2d67b9e5c47b, ; 530: Xamarin.Google.ErrorProne.Annotations.dll => 319
	i64 u0x734b76fdc0dc05bb, ; 531: lib_GoogleGson.dll.so => 189
	i64 u0x73a6be34e822f9d1, ; 532: lib_System.Runtime.Serialization.dll.so => 116
	i64 u0x73e4ce94e2eb6ffc, ; 533: lib_System.Memory.dll.so => 63
	i64 u0x743a1eccf080489a, ; 534: WindowsBase.dll => 166
	i64 u0x74fcb5b9d3ee6884, ; 535: Plugin.LocalNotification => 213
	i64 u0x755a91767330b3d4, ; 536: lib_Microsoft.Extensions.Configuration.dll.so => 197
	i64 u0x75c326eb821b85c4, ; 537: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 538: lib_Xamarin.AndroidX.SavedState.dll.so => 288
	i64 u0x76ca07b878f44da0, ; 539: System.Runtime.Numerics.dll => 111
	i64 u0x7736c8a96e51a061, ; 540: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 233
	i64 u0x7752fb9ea97b4e3a, ; 541: Firebase.Storage.dll => 177
	i64 u0x778a805e625329ef, ; 542: System.Linq.Parallel => 60
	i64 u0x77d48bf846bc0f10, ; 543: Xamarin.Io.OpenCensus.OpenCensusContribGrpcMetrics => 338
	i64 u0x77f8a4acc2fdc449, ; 544: System.Security.Cryptography.Cng.dll => 121
	i64 u0x780bc73597a503a9, ; 545: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 365
	i64 u0x782c5d8eb99ff201, ; 546: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 547: th/Microsoft.Maui.Controls.resources.dll => 375
	i64 u0x784b4ff3eed363ff, ; 548: Xamarin.Firebase.Common => 307
	i64 u0x78a45e51311409b6, ; 549: Xamarin.AndroidX.Fragment.dll => 259
	i64 u0x78ed4ab8f9d800a1, ; 550: Xamarin.AndroidX.Lifecycle.ViewModel => 273
	i64 u0x7939c1796e1e9b03, ; 551: Square.OkHttp.dll => 219
	i64 u0x7a090e7cbb6c0ed1, ; 552: Xamarin.GooglePlayServices.Location => 327
	i64 u0x7a5207a7c82d30b4, ; 553: lib_Xamarin.JSpecify.dll.so => 340
	i64 u0x7a7e7eddf79c5d26, ; 554: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 273
	i64 u0x7a9a57d43b0845fa, ; 555: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 556: Xamarin.AndroidX.Collection.dll => 240
	i64 u0x7adb8da2ac89b647, ; 557: fi/Microsoft.Maui.Controls.resources.dll => 355
	i64 u0x7b13d9eaa944ade8, ; 558: Xamarin.AndroidX.DynamicAnimation.dll => 255
	i64 u0x7bef86a4335c4870, ; 559: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 560: sk/Microsoft.Maui.Controls.resources.dll => 373
	i64 u0x7c2a0bd1e0f988fc, ; 561: lib-de-Microsoft.Maui.Controls.resources.dll.so => 352
	i64 u0x7c41d387501568ba, ; 562: System.Net.WebClient.dll => 77
	i64 u0x7c482cd79bd24b13, ; 563: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 244
	i64 u0x7cb95ad2a929d044, ; 564: Xamarin.GooglePlayServices.Basement => 325
	i64 u0x7cd2ec8eaf5241cd, ; 565: System.Security.dll => 131
	i64 u0x7cf9ae50dd350622, ; 566: Xamarin.Jetbrains.Annotations.dll => 339
	i64 u0x7d649b75d580bb42, ; 567: ms/Microsoft.Maui.Controls.resources.dll => 365
	i64 u0x7d8ee2bdc8e3aad1, ; 568: System.Numerics.Vectors => 83
	i64 u0x7df5df8db8eaa6ac, ; 569: Microsoft.Extensions.Logging.Debug => 203
	i64 u0x7dfc3d6d9d8d7b70, ; 570: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 571: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 572: lib_System.Security.Claims.dll.so => 119
	i64 u0x7e4465b3f78ad8d0, ; 573: Xamarin.KotlinX.Serialization.Core.dll => 345
	i64 u0x7e571cad5915e6c3, ; 574: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 268
	i64 u0x7e65340ed0da76d2, ; 575: Xamarin.Grpc.OkHttp => 334
	i64 u0x7e6b1ca712437d7d, ; 576: Xamarin.AndroidX.Emoji2.ViewsHelper => 257
	i64 u0x7e946809d6008ef2, ; 577: lib_System.ObjectModel.dll.so => 85
	i64 u0x7ea0272c1b4a9635, ; 578: lib_Xamarin.Android.Glide.dll.so => 225
	i64 u0x7eb4f0dc47488736, ; 579: lib_Xamarin.GooglePlayServices.Tasks.dll.so => 329
	i64 u0x7ecc13347c8fd849, ; 580: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 581: Xamarin.AndroidX.ViewPager.dll => 301
	i64 u0x7f9351cd44b1273f, ; 582: Microsoft.Extensions.Configuration.Abstractions => 198
	i64 u0x7fbd557c99b3ce6f, ; 583: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 266
	i64 u0x8076a9a44a2ca331, ; 584: System.Net.Quic => 72
	i64 u0x80da183a87731838, ; 585: System.Reflection.Metadata => 95
	i64 u0x812c069d5cdecc17, ; 586: System.dll => 165
	i64 u0x81381be520a60adb, ; 587: Xamarin.AndroidX.Interpolator.dll => 261
	i64 u0x8145faf772692484, ; 588: Google.Cloud.Firestore.V1.dll => 185
	i64 u0x81657cec2b31e8aa, ; 589: System.Net => 82
	i64 u0x81ab745f6c0f5ce6, ; 590: zh-Hant/Microsoft.Maui.Controls.resources => 381
	i64 u0x8277f2be6b5ce05f, ; 591: Xamarin.AndroidX.AppCompat => 234
	i64 u0x828f06563b30bc50, ; 592: lib_Xamarin.AndroidX.CardView.dll.so => 239
	i64 u0x82b399cb01b531c4, ; 593: lib_System.Web.dll.so => 154
	i64 u0x82df8f5532a10c59, ; 594: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 595: lib_System.Transactions.dll.so => 151
	i64 u0x82f6403342e12049, ; 596: uk/Microsoft.Maui.Controls.resources => 377
	i64 u0x83c14ba66c8e2b8c, ; 597: zh-Hans/Microsoft.Maui.Controls.resources => 380
	i64 u0x846ce984efea52c7, ; 598: System.Threading.Tasks.Parallel.dll => 144
	i64 u0x84ae73148a4557d2, ; 599: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 600: System.Runtime.Serialization.Json.dll => 113
	i64 u0x84f9060cc4a93c8f, ; 601: lib_SkiaSharp.dll.so => 215
	i64 u0x850c5ba0b57ce8e7, ; 602: lib_Xamarin.AndroidX.Collection.dll.so => 240
	i64 u0x851d02edd334b044, ; 603: Xamarin.AndroidX.VectorDrawable => 298
	i64 u0x85410a0ce2b82e74, ; 604: lib_Xamarin.Grpc.Context.dll.so => 332
	i64 u0x85c919db62150978, ; 605: Xamarin.AndroidX.Transition.dll => 297
	i64 u0x8662aaeb94fef37f, ; 606: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x866c029b39d9cde6, ; 607: Plugin.CloudFirestore.dll => 212
	i64 u0x86a909228dc7657b, ; 608: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 381
	i64 u0x86b3e00c36b84509, ; 609: Microsoft.Extensions.Configuration.dll => 197
	i64 u0x86b62cb077ec4fd7, ; 610: System.Runtime.Serialization.Xml => 115
	i64 u0x8706ffb12bf3f53d, ; 611: Xamarin.AndroidX.Annotation.Experimental => 232
	i64 u0x872a5b14c18d328c, ; 612: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 613: Xamarin.Android.Glide.Annotations.dll => 226
	i64 u0x8794c7c19600413d, ; 614: Xamarin.Grpc.Protobuf.Lite => 335
	i64 u0x87b7bede2c8fef74, ; 615: Xamarin.Firebase.ProtoliteWellKnownTypes.dll => 315
	i64 u0x87c69b87d9283884, ; 616: lib_System.Threading.Thread.dll.so => 146
	i64 u0x87f6569b25707834, ; 617: System.IO.Compression.Brotli.dll => 43
	i64 u0x87fef727071b7fe5, ; 618: Grpc.Net.Client => 192
	i64 u0x8842b3a5d2d3fb36, ; 619: Microsoft.Maui.Essentials => 209
	i64 u0x88926583efe7ee86, ; 620: Xamarin.AndroidX.Activity.Ktx.dll => 230
	i64 u0x88b16a1a7051ebe2, ; 621: Xamarin.Firebase.Annotations.dll => 305
	i64 u0x88ba6bc4f7762b03, ; 622: lib_System.Reflection.dll.so => 98
	i64 u0x88bda98e0cffb7a9, ; 623: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 344
	i64 u0x8930322c7bd8f768, ; 624: netstandard => 168
	i64 u0x897a606c9e39c75f, ; 625: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x898a5c6bc9e47ec1, ; 626: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 289
	i64 u0x89911a22005b92b7, ; 627: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 628: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 107
	i64 u0x8a19e3dc71b34b2c, ; 629: System.Reflection.TypeExtensions.dll => 97
	i64 u0x8a90bab2026e5b88, ; 630: Google.Cloud.Firestore.dll => 184
	i64 u0x8ad229ea26432ee2, ; 631: Xamarin.AndroidX.Loader => 278
	i64 u0x8b4ff5d0fdd5faa1, ; 632: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 633: System.Security.Principal.Windows => 128
	i64 u0x8b8d01333a96d0b5, ; 634: System.Diagnostics.Process.dll => 29
	i64 u0x8b9ceca7acae3451, ; 635: lib-he-Microsoft.Maui.Controls.resources.dll.so => 357
	i64 u0x8c230514448fef34, ; 636: Xamarin.Firebase.ProtoliteWellKnownTypes => 315
	i64 u0x8cb8f612b633affb, ; 637: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 290
	i64 u0x8cdfdb4ce85fb925, ; 638: lib_System.Security.Principal.Windows.dll.so => 128
	i64 u0x8cdfe7b8f4caa426, ; 639: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 640: Xamarin.AndroidX.CursorAdapter.dll => 250
	i64 u0x8d52f7ea2796c531, ; 641: Xamarin.AndroidX.Emoji2.dll => 256
	i64 u0x8d7b8ab4b3310ead, ; 642: System.Threading => 149
	i64 u0x8da188285aadfe8e, ; 643: System.Collections.Concurrent => 8
	i64 u0x8dfc1cfbf8858f95, ; 644: Grpc.Core.Api.dll => 191
	i64 u0x8e68459d22cb214f, ; 645: Square.OkHttp => 219
	i64 u0x8e8f269ad1e1ff94, ; 646: lib_Xamarin.AndroidX.Tracing.Tracing.Android.dll.so => 296
	i64 u0x8ec6e06a61c1baeb, ; 647: lib_Newtonsoft.Json.dll.so => 211
	i64 u0x8ed807bfe9858dfc, ; 648: Xamarin.AndroidX.Navigation.Common => 280
	i64 u0x8ee08b8194a30f48, ; 649: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 358
	i64 u0x8ef7601039857a44, ; 650: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 371
	i64 u0x8efbc0801a122264, ; 651: Xamarin.GooglePlayServices.Tasks.dll => 329
	i64 u0x8f32c6f611f6ffab, ; 652: pt/Microsoft.Maui.Controls.resources.dll => 370
	i64 u0x8f44b45eb046bbd1, ; 653: System.ServiceModel.Web.dll => 132
	i64 u0x8f8829d21c8985a4, ; 654: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 369
	i64 u0x8fbf5b0114c6dcef, ; 655: System.Globalization.dll => 42
	i64 u0x8fcc8c2a81f3d9e7, ; 656: Xamarin.KotlinX.Serialization.Core => 345
	i64 u0x8fd42635e63de49e, ; 657: Xamarin.Grpc.Context.dll => 332
	i64 u0x90263f8448b8f572, ; 658: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 659: _Microsoft.Android.Resource.Designer => 382
	i64 u0x90393bd4865292f3, ; 660: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 661: System.Threading.Tasks.Extensions.dll => 143
	i64 u0x90634f86c5ebe2b5, ; 662: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 274
	i64 u0x907b636704ad79ef, ; 663: lib_Microsoft.Maui.Controls.Xaml.dll.so => 207
	i64 u0x90e9efbfd68593e0, ; 664: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 265
	i64 u0x91418dc638b29e68, ; 665: lib_Xamarin.AndroidX.CustomView.dll.so => 251
	i64 u0x9157bd523cd7ed36, ; 666: lib_System.Text.Json.dll.so => 138
	i64 u0x91a74f07b30d37e2, ; 667: System.Linq.dll => 62
	i64 u0x91cb86ea3b17111d, ; 668: System.ServiceModel.Web => 132
	i64 u0x91fa41a87223399f, ; 669: ca/Microsoft.Maui.Controls.resources.dll => 349
	i64 u0x92054e486c0c7ea7, ; 670: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 671: lib_System.Xml.XPath.XDocument.dll.so => 160
	i64 u0x92a698e6d582778f, ; 672: Xamarin.Firebase.Components.dll => 308
	i64 u0x92b138fffca2b01e, ; 673: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 237
	i64 u0x92dfc2bfc6c6a888, ; 674: Xamarin.AndroidX.Lifecycle.LiveData => 265
	i64 u0x933da2c779423d68, ; 675: Xamarin.Android.Glide.Annotations => 226
	i64 u0x9388aad9b7ae40ce, ; 676: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 263
	i64 u0x93a39f9bbc3b3ca4, ; 677: Xamarin.GooglePlayServices.CloudMessaging.dll => 326
	i64 u0x93cfa73ab28d6e35, ; 678: ms/Microsoft.Maui.Controls.resources => 365
	i64 u0x941c00d21e5c0679, ; 679: lib_Xamarin.AndroidX.Transition.dll.so => 297
	i64 u0x944077d8ca3c6580, ; 680: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 681: System.Xml => 164
	i64 u0x94c8990839c4bdb1, ; 682: lib_Xamarin.AndroidX.Interpolator.dll.so => 261
	i64 u0x967fc325e09bfa8c, ; 683: es/Microsoft.Maui.Controls.resources => 354
	i64 u0x9686161486d34b81, ; 684: lib_Xamarin.AndroidX.ExifInterface.dll.so => 258
	i64 u0x9729c8c4c069c478, ; 685: Google.Apis.Core => 183
	i64 u0x9732d8dbddea3d9a, ; 686: id/Microsoft.Maui.Controls.resources => 361
	i64 u0x978be80e5210d31b, ; 687: Microsoft.Maui.Graphics.dll => 210
	i64 u0x979ab54025cc1c7f, ; 688: lib_Xamarin.GooglePlayServices.Base.dll.so => 324
	i64 u0x97a7d96b96967bc2, ; 689: lib_Firebase.Auth.dll.so => 175
	i64 u0x97b8c771ea3e4220, ; 690: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 691: System.Collections.Concurrent.dll => 8
	i64 u0x97e55f96df4ddd72, ; 692: lib_Xamarin.Firebase.Annotations.dll.so => 305
	i64 u0x984184e3c70d4419, ; 693: GoogleGson => 189
	i64 u0x9843944103683dd3, ; 694: Xamarin.AndroidX.Core.Core.Ktx => 248
	i64 u0x98b05cc81e6f333c, ; 695: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 289
	i64 u0x98d720cc4597562c, ; 696: System.Security.Cryptography.OpenSsl => 124
	i64 u0x991d510397f92d9d, ; 697: System.Linq.Expressions => 59
	i64 u0x996ceeb8a3da3d67, ; 698: System.Threading.Overlapped.dll => 141
	i64 u0x999cb19e1a04ffd3, ; 699: CommunityToolkit.Mvvm.dll => 174
	i64 u0x99a00ca5270c6878, ; 700: Xamarin.AndroidX.Navigation.Runtime => 282
	i64 u0x99cdc6d1f2d3a72f, ; 701: ko/Microsoft.Maui.Controls.resources.dll => 364
	i64 u0x9a01b1da98b6ee10, ; 702: Xamarin.AndroidX.Lifecycle.Runtime.dll => 269
	i64 u0x9a2d4c8408e9f4b6, ; 703: lib_Plugin.CloudFirestore.dll.so => 212
	i64 u0x9a5ccc274fd6e6ee, ; 704: Jsr305Binding.dll => 317
	i64 u0x9ae6940b11c02876, ; 705: lib_Xamarin.AndroidX.Window.dll.so => 303
	i64 u0x9b211a749105beac, ; 706: System.Transactions.Local => 150
	i64 u0x9b8734714671022d, ; 707: System.Threading.Tasks.Dataflow.dll => 142
	i64 u0x9bc6aea27fbf034f, ; 708: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 343
	i64 u0x9c244ac7cda32d26, ; 709: System.Security.Cryptography.X509Certificates.dll => 126
	i64 u0x9c465f280cf43733, ; 710: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 342
	i64 u0x9c4dd9126a77a711, ; 711: Xamarin.Firebase.Installations.InterOp => 314
	i64 u0x9c8f6872beab6408, ; 712: System.Xml.XPath.XDocument.dll => 160
	i64 u0x9ce01cf91101ae23, ; 713: System.Xml.XmlDocument => 162
	i64 u0x9d128180c81d7ce6, ; 714: Xamarin.AndroidX.CustomView.PoolingContainer => 252
	i64 u0x9d5dbcf5a48583fe, ; 715: lib_Xamarin.AndroidX.Activity.dll.so => 229
	i64 u0x9d74dee1a7725f34, ; 716: Microsoft.Extensions.Configuration.Abstractions.dll => 198
	i64 u0x9e4534b6adaf6e84, ; 717: nl/Microsoft.Maui.Controls.resources => 367
	i64 u0x9e4b95dec42769f7, ; 718: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 719: Xamarin.AndroidX.Navigation.Common.dll => 280
	i64 u0x9ed5eb4af213817e, ; 720: lib_Plugin.Maui.Calendar.dll.so => 214
	i64 u0x9ef542cf1f78c506, ; 721: Xamarin.AndroidX.Lifecycle.LiveData.Core => 266
	i64 u0x9f2c1126c41c6e52, ; 722: lib_Xamarin.Io.OpenCensus.OpenCensusContribGrpcMetrics.dll.so => 338
	i64 u0x9fc2184212c417ad, ; 723: Plugin.LocalNotification.dll => 213
	i64 u0xa00832eb975f56a8, ; 724: lib_System.Net.dll.so => 82
	i64 u0xa088c6d6689b264d, ; 725: Firebase.Auth.dll => 175
	i64 u0xa0ad78236b7b267f, ; 726: Xamarin.AndroidX.Window => 303
	i64 u0xa0d8259f4cc284ec, ; 727: lib_System.Security.Cryptography.dll.so => 127
	i64 u0xa0e17ca50c77a225, ; 728: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 318
	i64 u0xa0ff9b3e34d92f11, ; 729: lib_System.Resources.Writer.dll.so => 101
	i64 u0xa12fbfb4da97d9f3, ; 730: System.Threading.Timer.dll => 148
	i64 u0xa1440773ee9d341e, ; 731: Xamarin.Google.Android.Material => 316
	i64 u0xa1a184e02d8fa4f2, ; 732: Firebase.dll => 176
	i64 u0xa1b9d7c27f47219f, ; 733: Xamarin.AndroidX.Navigation.UI.dll => 283
	i64 u0xa2572680829d2c7c, ; 734: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 735: System.Xml.XmlDocument.dll => 162
	i64 u0xa2beee74530fc01c, ; 736: SkiaSharp.Views.Android => 216
	i64 u0xa308401900e5bed3, ; 737: lib_mscorlib.dll.so => 167
	i64 u0xa395572e7da6c99d, ; 738: lib_System.Security.dll.so => 131
	i64 u0xa3e683f24b43af6f, ; 739: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 740: Xamarin.AndroidX.VectorDrawable.Animated => 299
	i64 u0xa46aa1eaa214539b, ; 741: ko/Microsoft.Maui.Controls.resources => 364
	i64 u0xa4d20d2ff0563d26, ; 742: lib_CommunityToolkit.Mvvm.dll.so => 174
	i64 u0xa4edc8f2ceae241a, ; 743: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 744: System.Runtime.Serialization.Formatters.dll => 112
	i64 u0xa54b74df83dce92b, ; 745: System.Reflection.DispatchProxy => 90
	i64 u0xa579ed010d7e5215, ; 746: Xamarin.AndroidX.DocumentFile => 253
	i64 u0xa5b7152421ed6d98, ; 747: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 748: lib_System.Linq.Parallel.dll.so => 60
	i64 u0xa5ce5c755bde8cb8, ; 749: lib_System.Security.Cryptography.Csp.dll.so => 122
	i64 u0xa5e599d1e0524750, ; 750: System.Numerics.Vectors.dll => 83
	i64 u0xa5f1ba49b85dd355, ; 751: System.Security.Cryptography.dll => 127
	i64 u0xa5f1e826b58a6998, ; 752: System.Linq.Async.dll => 222
	i64 u0xa61975a5a37873ea, ; 753: lib_System.Xml.XmlSerializer.dll.so => 163
	i64 u0xa6593e21584384d2, ; 754: lib_Jsr305Binding.dll.so => 317
	i64 u0xa66cbee0130865f7, ; 755: lib_WindowsBase.dll.so => 166
	i64 u0xa67dbee13e1df9ca, ; 756: Xamarin.AndroidX.SavedState.dll => 288
	i64 u0xa684b098dd27b296, ; 757: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 291
	i64 u0xa68a420042bb9b1f, ; 758: Xamarin.AndroidX.DrawerLayout.dll => 254
	i64 u0xa6d26156d1cacc7c, ; 759: Xamarin.Android.Glide.dll => 225
	i64 u0xa75386b5cb9595aa, ; 760: Xamarin.AndroidX.Lifecycle.Runtime.Android => 270
	i64 u0xa763fbb98df8d9fb, ; 761: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 762: Xamarin.AndroidX.Lifecycle.Common.Jvm => 264
	i64 u0xa7c31b56b4dc7b33, ; 763: hu/Microsoft.Maui.Controls.resources => 360
	i64 u0xa7eab29ed44b4e7a, ; 764: Mono.Android.Export => 170
	i64 u0xa8195217cbf017b7, ; 765: Microsoft.VisualBasic.Core => 2
	i64 u0xa843f6095f0d247d, ; 766: Xamarin.GooglePlayServices.Base.dll => 324
	i64 u0xa859a95830f367ff, ; 767: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 275
	i64 u0xa8b52f21e0dbe690, ; 768: System.Runtime.Serialization.dll => 116
	i64 u0xa8ee4ed7de2efaee, ; 769: Xamarin.AndroidX.Annotation.dll => 231
	i64 u0xa952cc4a0d808a59, ; 770: lib_Google.Api.CommonProtos.dll.so => 178
	i64 u0xa95590e7c57438a4, ; 771: System.Configuration => 19
	i64 u0xaa2219c8e3449ff5, ; 772: Microsoft.Extensions.Logging.Abstractions => 202
	i64 u0xaa443ac34067eeef, ; 773: System.Private.Xml.dll => 89
	i64 u0xaa52de307ef5d1dd, ; 774: System.Net.Http => 65
	i64 u0xaa9a7b0214a5cc5c, ; 775: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 776: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 200
	i64 u0xaaf84bb3f052a265, ; 777: el/Microsoft.Maui.Controls.resources => 353
	i64 u0xab375658f5084c9f, ; 778: lib_Google.Cloud.Firestore.dll.so => 184
	i64 u0xab9af77b5b67a0b8, ; 779: Xamarin.AndroidX.ConstraintLayout.Core => 245
	i64 u0xab9c1b2687d86b0b, ; 780: lib_System.Linq.Expressions.dll.so => 59
	i64 u0xac2af3fa195a15ce, ; 781: System.Runtime.Numerics => 111
	i64 u0xac5376a2a538dc10, ; 782: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 266
	i64 u0xac5acae88f60357e, ; 783: System.Diagnostics.Tools.dll => 32
	i64 u0xac65e40f62b6b90e, ; 784: Google.Protobuf => 188
	i64 u0xac79c7e46047ad98, ; 785: System.Security.Principal.Windows.dll => 128
	i64 u0xac98d31068e24591, ; 786: System.Xml.XDocument => 159
	i64 u0xacd46e002c3ccb97, ; 787: ro/Microsoft.Maui.Controls.resources => 371
	i64 u0xacda2fab67639416, ; 788: Xamarin.Firebase.Installations => 313
	i64 u0xacdd9e4180d56dda, ; 789: Xamarin.AndroidX.Concurrent.Futures => 243
	i64 u0xacf42eea7ef9cd12, ; 790: System.Threading.Channels => 140
	i64 u0xad7e82ed3b0f16d0, ; 791: lib_Xamarin.AndroidX.DocumentFile.dll.so => 253
	i64 u0xad89c07347f1bad6, ; 792: nl/Microsoft.Maui.Controls.resources.dll => 367
	i64 u0xadbb53caf78a79d2, ; 793: System.Web.HttpUtility => 153
	i64 u0xadc90ab061a9e6e4, ; 794: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 795: Xamarin.AndroidX.Collection.Ktx => 242
	i64 u0xadd8eda2edf396ad, ; 796: Xamarin.Android.Glide.GifDecoder => 228
	i64 u0xadf4cf30debbeb9a, ; 797: System.Net.ServicePoint.dll => 75
	i64 u0xadf511667bef3595, ; 798: System.Net.Security => 74
	i64 u0xae0aaa94fdcfce0f, ; 799: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 800: Java.Interop => 169
	i64 u0xae53579c90db1107, ; 801: System.ObjectModel.dll => 85
	i64 u0xaf732d0b2193b8f5, ; 802: System.Security.Cryptography.OpenSsl.dll => 124
	i64 u0xafdb94dbccd9d11c, ; 803: Xamarin.AndroidX.Lifecycle.LiveData.dll => 265
	i64 u0xafe29f45095518e7, ; 804: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 276
	i64 u0xb03ae931fb25607e, ; 805: Xamarin.AndroidX.ConstraintLayout => 244
	i64 u0xb05cc42cd94c6d9d, ; 806: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 374
	i64 u0xb0ac21bec8f428c5, ; 807: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 272
	i64 u0xb0bb43dc52ea59f9, ; 808: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 809: System.Security.AccessControl => 118
	i64 u0xb220631954820169, ; 810: System.Text.RegularExpressions => 139
	i64 u0xb2376e1dbf8b4ed7, ; 811: System.Security.Cryptography.Csp => 122
	i64 u0xb2a1959fe95c5402, ; 812: lib_System.Runtime.InteropServices.JavaScript.dll.so => 106
	i64 u0xb2a3f67f3bf29fce, ; 813: da/Microsoft.Maui.Controls.resources => 351
	i64 u0xb363b43eeec5798e, ; 814: lib_Xamarin.Firebase.Iid.Interop.dll.so => 312
	i64 u0xb3874072ee0ecf8c, ; 815: Xamarin.AndroidX.VectorDrawable.Animated.dll => 299
	i64 u0xb39eed1decc0cd95, ; 816: Google.Api.Gax.dll => 179
	i64 u0xb3f0a0fcda8d3ebc, ; 817: Xamarin.AndroidX.CardView => 239
	i64 u0xb404462cdf3bffdb, ; 818: lib_Xamarin.Firebase.ProtoliteWellKnownTypes.dll.so => 315
	i64 u0xb4512edf6d2b372b, ; 819: Google.Cloud.Location => 186
	i64 u0xb46be1aa6d4fff93, ; 820: hi/Microsoft.Maui.Controls.resources => 358
	i64 u0xb477491be13109d8, ; 821: ar/Microsoft.Maui.Controls.resources => 348
	i64 u0xb4bd7015ecee9d86, ; 822: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 823: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 824: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb5c38bf497a4cfe2, ; 825: lib_System.Threading.Tasks.dll.so => 145
	i64 u0xb5c7fcdafbc67ee4, ; 826: Microsoft.Extensions.Logging.Abstractions.dll => 202
	i64 u0xb5ea31d5244c6626, ; 827: System.Threading.ThreadPool.dll => 147
	i64 u0xb7212c4683a94afe, ; 828: System.Drawing.Primitives => 35
	i64 u0xb7b7753d1f319409, ; 829: sv/Microsoft.Maui.Controls.resources => 374
	i64 u0xb81a2c6e0aee50fe, ; 830: lib_System.Private.CoreLib.dll.so => 173
	i64 u0xb898d1802c1a108c, ; 831: lib_System.Management.dll.so => 223
	i64 u0xb8b0a9b3dfbc5cb7, ; 832: Xamarin.AndroidX.Window.Extensions.Core.Core => 304
	i64 u0xb8c60af47c08d4da, ; 833: System.Net.ServicePoint => 75
	i64 u0xb8e68d20aad91196, ; 834: lib_System.Xml.XPath.dll.so => 161
	i64 u0xb90ff82c284e9af9, ; 835: Grpc.Core.Api => 191
	i64 u0xb9185c33a1643eed, ; 836: Microsoft.CSharp.dll => 1
	i64 u0xb960d6b2200ba320, ; 837: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll => 277
	i64 u0xb9b8001adf4ed7cc, ; 838: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 292
	i64 u0xb9f64d3b230def68, ; 839: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 370
	i64 u0xb9fc3c8a556e3691, ; 840: ja/Microsoft.Maui.Controls.resources => 363
	i64 u0xba4670aa94a2b3c6, ; 841: lib_System.Xml.XDocument.dll.so => 159
	i64 u0xba48785529705af9, ; 842: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 843: lib_System.Windows.dll.so => 155
	i64 u0xbb286883bc35db36, ; 844: System.Transactions.dll => 151
	i64 u0xbb6026d73f757bcf, ; 845: Google.Api.Gax.Grpc => 180
	i64 u0xbb65706fde942ce3, ; 846: System.Net.Sockets => 76
	i64 u0xbba28979413cad9e, ; 847: lib_System.Runtime.CompilerServices.VisualC.dll.so => 103
	i64 u0xbbd180354b67271a, ; 848: System.Runtime.Serialization.Formatters => 112
	i64 u0xbc0e640e7c6bcdf8, ; 849: Xamarin.Grpc.Api => 331
	i64 u0xbc260cdba33291a3, ; 850: Xamarin.AndroidX.Arch.Core.Common.dll => 236
	i64 u0xbd0e2c0d55246576, ; 851: System.Net.Http.dll => 65
	i64 u0xbd3fbd85b9e1cb29, ; 852: lib_System.Net.HttpListener.dll.so => 66
	i64 u0xbd437a2cdb333d0d, ; 853: Xamarin.AndroidX.ViewPager2 => 302
	i64 u0xbd4f572d2bd0a789, ; 854: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd5d0b88d3d647a5, ; 855: lib_Xamarin.AndroidX.Browser.dll.so => 238
	i64 u0xbd854cde2dba71a3, ; 856: lib_Square.OkHttp.dll.so => 219
	i64 u0xbd877b14d0b56392, ; 857: System.Runtime.Intrinsics.dll => 109
	i64 u0xbd960c672af2c51e, ; 858: Xamarin.GooglePlayServices.Stats => 328
	i64 u0xbe65a49036345cf4, ; 859: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 860: Xamarin.AndroidX.AppCompat.AppCompatResources => 235
	i64 u0xbef9919db45b4ca7, ; 861: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 862: lib_Xamarin.AndroidX.Annotation.dll.so => 231
	i64 u0xbfc1e1fb3095f2b3, ; 863: lib_System.Net.Http.Json.dll.so => 64
	i64 u0xc040a4ab55817f58, ; 864: ar/Microsoft.Maui.Controls.resources.dll => 348
	i64 u0xc07cadab29efeba0, ; 865: Xamarin.AndroidX.Core.Core.Ktx.dll => 248
	i64 u0xc0d928351ab5ca77, ; 866: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 867: System.Runtime.Intrinsics => 109
	i64 u0xc111030af54d7191, ; 868: System.Resources.Writer => 101
	i64 u0xc12b8b3afa48329c, ; 869: lib_System.Linq.dll.so => 62
	i64 u0xc1649f545b2f76aa, ; 870: Grpc.Auth => 190
	i64 u0xc183ca0b74453aa9, ; 871: lib_System.Threading.Tasks.Dataflow.dll.so => 142
	i64 u0xc1ff9ae3cdb6e1e6, ; 872: Xamarin.AndroidX.Activity.dll => 229
	i64 u0xc226d517e7e30388, ; 873: lib_Xamarin.Grpc.Stub.dll.so => 336
	i64 u0xc26c064effb1dea9, ; 874: System.Buffers.dll => 7
	i64 u0xc2850fbba221599d, ; 875: lib_Google.Apis.Core.dll.so => 183
	i64 u0xc28c50f32f81cc73, ; 876: ja/Microsoft.Maui.Controls.resources.dll => 363
	i64 u0xc2902f6cf5452577, ; 877: lib_Mono.Android.Export.dll.so => 170
	i64 u0xc2a3bca55b573141, ; 878: System.IO.FileSystem.Watcher => 50
	i64 u0xc2bcfec99f69365e, ; 879: Xamarin.AndroidX.ViewPager2.dll => 302
	i64 u0xc30b52815b58ac2c, ; 880: lib_System.Runtime.Serialization.Xml.dll.so => 115
	i64 u0xc36d7d89c652f455, ; 881: System.Threading.Overlapped => 141
	i64 u0xc396b285e59e5493, ; 882: GoogleGson.dll => 189
	i64 u0xc3c86c1e5e12f03d, ; 883: WindowsBase => 166
	i64 u0xc421b61fd853169d, ; 884: lib_System.Net.WebSockets.Client.dll.so => 80
	i64 u0xc4628cb75a5204b4, ; 885: lib_Xamarin.GooglePlayServices.CloudMessaging.dll.so => 326
	i64 u0xc463e077917aa21d, ; 886: System.Runtime.Serialization.Json => 113
	i64 u0xc4d3858ed4d08512, ; 887: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 276
	i64 u0xc50fded0ded1418c, ; 888: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 889: lib_System.Net.Requests.dll.so => 73
	i64 u0xc5293b19e4dc230e, ; 890: Xamarin.AndroidX.Navigation.Fragment => 281
	i64 u0xc5325b2fcb37446f, ; 891: lib_System.Private.Xml.dll.so => 89
	i64 u0xc535cb9a21385d9b, ; 892: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 227
	i64 u0xc5a0f4b95a699af7, ; 893: lib_System.Private.Uri.dll.so => 87
	i64 u0xc5cdcd5b6277579e, ; 894: lib_System.Security.Cryptography.Algorithms.dll.so => 120
	i64 u0xc5d608afb58abba2, ; 895: Google.Apis.Auth.dll => 182
	i64 u0xc5ec286825cb0bf4, ; 896: Xamarin.AndroidX.Tracing.Tracing => 295
	i64 u0xc5fe73d2394f68ac, ; 897: Xamarin.Io.OpenCensus.OpenCensusApi.dll => 337
	i64 u0xc62af3e2d6d38289, ; 898: lib_Xamarin.Firebase.Firestore.dll.so => 310
	i64 u0xc6706bc8aa7fe265, ; 899: Xamarin.AndroidX.Annotation.Jvm => 233
	i64 u0xc6c2d0367d74968d, ; 900: Microcharts.Maui => 195
	i64 u0xc6e1dcc756796701, ; 901: MoodJournal => 0
	i64 u0xc7c01e7d7c93a110, ; 902: System.Text.Encoding.Extensions.dll => 135
	i64 u0xc7ce851898a4548e, ; 903: lib_System.Web.HttpUtility.dll.so => 153
	i64 u0xc809d4089d2556b2, ; 904: System.Runtime.InteropServices.JavaScript.dll => 106
	i64 u0xc858a28d9ee5a6c5, ; 905: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 906: System.Reflection.DispatchProxy.dll => 90
	i64 u0xc8b01aafa0eb7f80, ; 907: Xamarin.Firebase.Iid.dll => 311
	i64 u0xc9c62c8f354ac568, ; 908: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xca3a723e7342c5b6, ; 909: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 376
	i64 u0xca5801070d9fccfb, ; 910: System.Text.Encoding => 136
	i64 u0xcab3493c70141c2d, ; 911: pl/Microsoft.Maui.Controls.resources => 368
	i64 u0xcab69b9a31439815, ; 912: lib_Xamarin.Google.ErrorProne.TypeAnnotations.dll.so => 320
	i64 u0xcacfddc9f7c6de76, ; 913: ro/Microsoft.Maui.Controls.resources.dll => 371
	i64 u0xcadbc92899a777f0, ; 914: Xamarin.AndroidX.Startup.StartupRuntime => 293
	i64 u0xcb76efab0f56f81a, ; 915: System.Reactive => 224
	i64 u0xcba1cb79f45292b5, ; 916: Xamarin.Android.Glide.GifDecoder.dll => 228
	i64 u0xcbb5f80c7293e696, ; 917: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 918: lib__Microsoft.Android.Resource.Designer.dll.so => 382
	i64 u0xcc15da1e07bbd994, ; 919: Xamarin.AndroidX.SlidingPaneLayout => 292
	i64 u0xcc182c3afdc374d6, ; 920: Microsoft.Bcl.AsyncInterfaces => 196
	i64 u0xcc2876b32ef2794c, ; 921: lib_System.Text.RegularExpressions.dll.so => 139
	i64 u0xcc5c3bb714c4561e, ; 922: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 344
	i64 u0xcc76886e09b88260, ; 923: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 346
	i64 u0xcc9fa2923aa1c9ef, ; 924: System.Diagnostics.Contracts.dll => 25
	i64 u0xccf25c4b634ccd3a, ; 925: zh-Hans/Microsoft.Maui.Controls.resources.dll => 380
	i64 u0xcd10a42808629144, ; 926: System.Net.Requests => 73
	i64 u0xcdc772bccba7085f, ; 927: MoodJournal.dll => 0
	i64 u0xcdca1b920e9f53ba, ; 928: Xamarin.AndroidX.Interpolator => 261
	i64 u0xcdd0c48b6937b21c, ; 929: Xamarin.AndroidX.SwipeRefreshLayout => 294
	i64 u0xcf23d8093f3ceadf, ; 930: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 931: System.Net.Mail.dll => 67
	i64 u0xcf8fc898f98b0d34, ; 932: System.Private.Xml.Linq => 88
	i64 u0xd04b5f59ed596e31, ; 933: System.Reflection.Metadata.dll => 95
	i64 u0xd063299fcfc0c93f, ; 934: lib_System.Runtime.Serialization.Json.dll.so => 113
	i64 u0xd0de8a113e976700, ; 935: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 936: System.Runtime.Extensions => 104
	i64 u0xd1194e1d8a8de83c, ; 937: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 264
	i64 u0xd12beacdfc14f696, ; 938: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 939: System.Net.Quic.dll => 72
	i64 u0xd20588bdafd1c17c, ; 940: Xamarin.Grpc.Stub.dll => 336
	i64 u0xd3144156a3727ebe, ; 941: Xamarin.Google.Guava.ListenableFuture => 323
	i64 u0xd333d0af9e423810, ; 942: System.Runtime.InteropServices => 108
	i64 u0xd33a415cb4278969, ; 943: System.Security.Cryptography.Encoding.dll => 123
	i64 u0xd3426d966bb704f5, ; 944: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 235
	i64 u0xd3651b6fc3125825, ; 945: System.Private.Uri.dll => 87
	i64 u0xd373685349b1fe8b, ; 946: Microsoft.Extensions.Logging.dll => 201
	i64 u0xd3801faafafb7698, ; 947: System.Private.DataContractSerialization.dll => 86
	i64 u0xd3e4c8d6a2d5d470, ; 948: it/Microsoft.Maui.Controls.resources => 362
	i64 u0xd3edcc1f25459a50, ; 949: System.Reflection.Emit => 93
	i64 u0xd4645626dffec99d, ; 950: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 200
	i64 u0xd4fa0abb79079ea9, ; 951: System.Security.Principal.dll => 129
	i64 u0xd5507e11a2b2839f, ; 952: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 276
	i64 u0xd5d04bef8478ea19, ; 953: Xamarin.AndroidX.Tracing.Tracing.dll => 295
	i64 u0xd60815f26a12e140, ; 954: Microsoft.Extensions.Logging.Debug.dll => 203
	i64 u0xd64f50eb4ba264b3, ; 955: lib_Google.LongRunning.dll.so => 187
	i64 u0xd6694f8359737e4e, ; 956: Xamarin.AndroidX.SavedState => 288
	i64 u0xd6949e129339eae5, ; 957: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 248
	i64 u0xd6d21782156bc35b, ; 958: Xamarin.AndroidX.SwipeRefreshLayout.dll => 294
	i64 u0xd6de019f6af72435, ; 959: Xamarin.AndroidX.ConstraintLayout.Core.dll => 245
	i64 u0xd6ed09ee80649430, ; 960: lib_Xamarin.Grpc.Core.dll.so => 333
	i64 u0xd6f697a581fc6fe3, ; 961: Xamarin.Google.ErrorProne.TypeAnnotations.dll => 320
	i64 u0xd70956d1e6deefb9, ; 962: Jsr305Binding => 317
	i64 u0xd72329819cbbbc44, ; 963: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 198
	i64 u0xd72c760af136e863, ; 964: System.Xml.XmlSerializer.dll => 163
	i64 u0xd753f071e44c2a03, ; 965: lib_System.Security.SecureString.dll.so => 130
	i64 u0xd7b3764ada9d341d, ; 966: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 202
	i64 u0xd7dfd89d34e8dd1d, ; 967: Square.OkIO => 220
	i64 u0xd7f0088bc5ad71f2, ; 968: Xamarin.AndroidX.VersionedParcelable => 300
	i64 u0xd8113d9a7e8ad136, ; 969: System.CodeDom => 221
	i64 u0xd8fb25e28ae30a12, ; 970: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 285
	i64 u0xda1dfa4c534a9251, ; 971: Microsoft.Extensions.DependencyInjection => 199
	i64 u0xdad05a11827959a3, ; 972: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 973: System.IO.FileSystem.Primitives => 49
	i64 u0xdaff1e02a729f3a2, ; 974: Xamarin.Grpc.Android => 330
	i64 u0xdb5383ab5865c007, ; 975: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 378
	i64 u0xdb58816721c02a59, ; 976: lib_System.Reflection.Emit.ILGeneration.dll.so => 91
	i64 u0xdb8f858873e2186b, ; 977: SkiaSharp.Views.Maui.Controls => 217
	i64 u0xdbeda89f832aa805, ; 978: vi/Microsoft.Maui.Controls.resources.dll => 378
	i64 u0xdbf2a779fbc3ac31, ; 979: System.Transactions.Local.dll => 150
	i64 u0xdbf9607a441b4505, ; 980: System.Linq => 62
	i64 u0xdbfc90157a0de9b0, ; 981: lib_System.Text.Encoding.dll.so => 136
	i64 u0xdc75032002d1a212, ; 982: lib_System.Transactions.Local.dll.so => 150
	i64 u0xdca8be7403f92d4f, ; 983: lib_System.Linq.Queryable.dll.so => 61
	i64 u0xdcbd21904ff0f297, ; 984: Google.Apis => 181
	i64 u0xdce2c53525640bf3, ; 985: Microsoft.Extensions.Logging => 201
	i64 u0xdd2b722d78ef5f43, ; 986: System.Runtime.dll => 117
	i64 u0xdd67031857c72f96, ; 987: lib_System.Text.Encodings.Web.dll.so => 137
	i64 u0xdd70765ad6162057, ; 988: Xamarin.JSpecify => 340
	i64 u0xdd92e229ad292030, ; 989: System.Numerics.dll => 84
	i64 u0xdddcdd701e911af1, ; 990: lib_Xamarin.AndroidX.Legacy.Support.Core.Utils.dll.so => 262
	i64 u0xdde30e6b77aa6f6c, ; 991: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 380
	i64 u0xde110ae80fa7c2e2, ; 992: System.Xml.XDocument.dll => 159
	i64 u0xde4726fcdf63a198, ; 993: Xamarin.AndroidX.Transition => 297
	i64 u0xde572c2b2fb32f93, ; 994: lib_System.Threading.Tasks.Extensions.dll.so => 143
	i64 u0xde8769ebda7d8647, ; 995: hr/Microsoft.Maui.Controls.resources.dll => 359
	i64 u0xdee075f3477ef6be, ; 996: Xamarin.AndroidX.ExifInterface.dll => 258
	i64 u0xdf4b773de8fb1540, ; 997: System.Net.dll => 82
	i64 u0xdfa254ebb4346068, ; 998: System.Net.Ping => 70
	i64 u0xe0142572c095a480, ; 999: Xamarin.AndroidX.AppCompat.dll => 234
	i64 u0xe021eaa401792a05, ; 1000: System.Text.Encoding.dll => 136
	i64 u0xe02f89350ec78051, ; 1001: Xamarin.AndroidX.CoordinatorLayout.dll => 246
	i64 u0xe0496b9d65ef5474, ; 1002: Xamarin.Android.Glide.DiskLruCache.dll => 227
	i64 u0xe10b760bb1462e7a, ; 1003: lib_System.Security.Cryptography.Primitives.dll.so => 125
	i64 u0xe14ff8e84737288a, ; 1004: Xamarin.Firebase.Installations.InterOp.dll => 314
	i64 u0xe192a588d4410686, ; 1005: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 1006: System.Runtime.Loader => 110
	i64 u0xe1a77eb8831f7741, ; 1007: System.Security.SecureString.dll => 130
	i64 u0xe1b52f9f816c70ef, ; 1008: System.Private.Xml.Linq.dll => 88
	i64 u0xe1e199c8ab02e356, ; 1009: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1010: System.Net.Security.dll => 74
	i64 u0xe2252a80fe853de4, ; 1011: lib_System.Security.Principal.dll.so => 129
	i64 u0xe22fa4c9c645db62, ; 1012: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 1013: System.Net.Requests.dll => 73
	i64 u0xe26692647e6bcb62, ; 1014: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 271
	i64 u0xe29b73bc11392966, ; 1015: lib-id-Microsoft.Maui.Controls.resources.dll.so => 361
	i64 u0xe2ad448dee50fbdf, ; 1016: System.Xml.Serialization => 158
	i64 u0xe2d920f978f5d85c, ; 1017: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1018: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 1019: Mono.Android.Export.dll => 170
	i64 u0xe3811d68d4fe8463, ; 1020: pt-BR/Microsoft.Maui.Controls.resources.dll => 369
	i64 u0xe3b7cbae5ad66c75, ; 1021: lib_System.Security.Cryptography.Encoding.dll.so => 123
	i64 u0xe4292b48f3224d5b, ; 1022: lib_Xamarin.AndroidX.Core.ViewTree.dll.so => 249
	i64 u0xe4507486c308efd4, ; 1023: lib_Xamarin.GooglePlayServices.Location.dll.so => 327
	i64 u0xe494f7ced4ecd10a, ; 1024: hu/Microsoft.Maui.Controls.resources.dll => 360
	i64 u0xe49a982a2533a332, ; 1025: lib_Google.Cloud.Location.dll.so => 186
	i64 u0xe4a9b1e40d1e8917, ; 1026: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 355
	i64 u0xe4f74a0b5bf9703f, ; 1027: System.Runtime.Serialization.Primitives => 114
	i64 u0xe5434e8a119ceb69, ; 1028: lib_Mono.Android.dll.so => 172
	i64 u0xe55703b9ce5c038a, ; 1029: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 1030: Microsoft.VisualBasic => 3
	i64 u0xe62913cc36bc07ec, ; 1031: System.Xml.dll => 164
	i64 u0xe6e77c648688b75b, ; 1032: Google.Api.CommonProtos.dll => 178
	i64 u0xe7b0691bcbb5a85d, ; 1033: System.Linq.Async => 222
	i64 u0xe7bea09c4900a191, ; 1034: Xamarin.AndroidX.VectorDrawable.dll => 298
	i64 u0xe7e03cc18dcdeb49, ; 1035: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 1036: lib_System.Configuration.dll.so => 19
	i64 u0xe86b0df4ba9e5db8, ; 1037: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 270
	i64 u0xe896622fe0902957, ; 1038: System.Reflection.Emit.dll => 93
	i64 u0xe89a2a9ef110899b, ; 1039: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 1040: Microsoft.Win32.Registry => 5
	i64 u0xe8efe6c2171f7cd2, ; 1041: Xamarin.Google.Guava.dll => 321
	i64 u0xe93ca41931f1f2d0, ; 1042: Xamarin.Grpc.Api.dll => 331
	i64 u0xe957c3976986ab72, ; 1043: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 304
	i64 u0xe98163eb702ae5c5, ; 1044: Xamarin.AndroidX.Arch.Core.Runtime => 237
	i64 u0xe98b0e4b4d44e931, ; 1045: lib_Grpc.Net.Client.dll.so => 192
	i64 u0xe994f23ba4c143e5, ; 1046: Xamarin.KotlinX.Coroutines.Android => 342
	i64 u0xe9b9c8c0458fd92a, ; 1047: System.Windows => 155
	i64 u0xe9d166d87a7f2bdb, ; 1048: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 293
	i64 u0xea5a4efc2ad81d1b, ; 1049: Xamarin.Google.ErrorProne.Annotations => 319
	i64 u0xeaf8e9970fc2fe69, ; 1050: System.Management => 223
	i64 u0xeb2313fe9d65b785, ; 1051: Xamarin.AndroidX.ConstraintLayout.dll => 244
	i64 u0xeb6e275e78cb8d42, ; 1052: Xamarin.AndroidX.LocalBroadcastManager.dll => 279
	i64 u0xeb710a05c0467d46, ; 1053: Xamarin.GooglePlayServices.CloudMessaging => 326
	i64 u0xeb9973cda26e858f, ; 1054: Xamarin.Firebase.Common.dll => 307
	i64 u0xed19c616b3fcb7eb, ; 1055: Xamarin.AndroidX.VersionedParcelable.dll => 300
	i64 u0xedc4817167106c23, ; 1056: System.Net.Sockets.dll => 76
	i64 u0xedc632067fb20ff3, ; 1057: System.Memory.dll => 63
	i64 u0xedc8e4ca71a02a8b, ; 1058: Xamarin.AndroidX.Navigation.Runtime.dll => 282
	i64 u0xee81f5b3f1c4f83b, ; 1059: System.Threading.ThreadPool => 147
	i64 u0xeeb7ebb80150501b, ; 1060: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 241
	i64 u0xeefc635595ef57f0, ; 1061: System.Security.Cryptography.Cng => 121
	i64 u0xef03b1b5a04e9709, ; 1062: System.Text.Encoding.CodePages.dll => 134
	i64 u0xef432781d5667f61, ; 1063: Xamarin.AndroidX.Print => 284
	i64 u0xef5bcbe61622ee5f, ; 1064: Xamarin.AndroidX.Tracing.Tracing.Android.dll => 296
	i64 u0xef602c523fe2e87a, ; 1065: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 323
	i64 u0xef72742e1bcca27a, ; 1066: Microsoft.Maui.Essentials.dll => 209
	i64 u0xefd1e0c4e5c9b371, ; 1067: System.Resources.ResourceManager.dll => 100
	i64 u0xefe8f8d5ed3c72ea, ; 1068: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 1069: Xamarin.AndroidX.Activity => 229
	i64 u0xf008bcd238ede2c8, ; 1070: System.CodeDom.dll => 221
	i64 u0xf00c29406ea45e19, ; 1071: es/Microsoft.Maui.Controls.resources.dll => 354
	i64 u0xf09e47b6ae914f6e, ; 1072: System.Net.NameResolution => 68
	i64 u0xf0ac2b489fed2e35, ; 1073: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1074: lib_System.Net.ServicePoint.dll.so => 75
	i64 u0xf0de2537ee19c6ca, ; 1075: lib_System.Net.WebHeaderCollection.dll.so => 78
	i64 u0xf1138779fa181c68, ; 1076: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 269
	i64 u0xf11b621fc87b983f, ; 1077: Microsoft.Maui.Controls.Xaml.dll => 207
	i64 u0xf161f4f3c3b7e62c, ; 1078: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1079: System.ValueTuple => 152
	i64 u0xf1c4b4005493d871, ; 1080: System.Formats.Asn1.dll => 38
	i64 u0xf22514cfad2d598b, ; 1081: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so => 277
	i64 u0xf238bd79489d3a96, ; 1082: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 367
	i64 u0xf2feea356ba760af, ; 1083: Xamarin.AndroidX.Arch.Core.Runtime.dll => 237
	i64 u0xf300e085f8acd238, ; 1084: lib_System.ServiceProcess.dll.so => 133
	i64 u0xf34e52b26e7e059d, ; 1085: System.Runtime.CompilerServices.VisualC.dll => 103
	i64 u0xf37221fda4ef8830, ; 1086: lib_Xamarin.Google.Android.Material.dll.so => 316
	i64 u0xf3ad9b8fb3eefd12, ; 1087: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 1088: System => 165
	i64 u0xf408654b2a135055, ; 1089: System.Reflection.Emit.ILGeneration.dll => 91
	i64 u0xf4103170a1de5bd0, ; 1090: System.Linq.Queryable.dll => 61
	i64 u0xf42d20c23173d77c, ; 1091: lib_System.ServiceModel.Web.dll.so => 132
	i64 u0xf4727d423e5d26f3, ; 1092: SkiaSharp => 215
	i64 u0xf483be3bba89b4ff, ; 1093: lib_Xamarin.Grpc.Api.dll.so => 331
	i64 u0xf4c1dd70a5496a17, ; 1094: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 1095: System.ServiceProcess.dll => 133
	i64 u0xf4eeeaa566e9b970, ; 1096: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 252
	i64 u0xf518f63ead11fcd1, ; 1097: System.Threading.Tasks => 145
	i64 u0xf5fc7602fe27b333, ; 1098: System.Net.WebHeaderCollection => 78
	i64 u0xf6077741019d7428, ; 1099: Xamarin.AndroidX.CoordinatorLayout => 246
	i64 u0xf6742cbf457c450b, ; 1100: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 270
	i64 u0xf70c0a7bf8ccf5af, ; 1101: System.Web => 154
	i64 u0xf73b506af603bfe1, ; 1102: lib_Square.OkIO.dll.so => 220
	i64 u0xf77b20923f07c667, ; 1103: de/Microsoft.Maui.Controls.resources.dll => 352
	i64 u0xf7e2cac4c45067b3, ; 1104: lib_System.Numerics.Vectors.dll.so => 83
	i64 u0xf7e74930e0e3d214, ; 1105: zh-HK/Microsoft.Maui.Controls.resources.dll => 379
	i64 u0xf7fa0bf77fe677cc, ; 1106: Newtonsoft.Json.dll => 211
	i64 u0xf84773b5c81e3cef, ; 1107: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 377
	i64 u0xf84bc13af9296b71, ; 1108: Firebase => 176
	i64 u0xf8aac5ea82de1348, ; 1109: System.Linq.Queryable => 61
	i64 u0xf8b77539b362d3ba, ; 1110: lib_System.Reflection.Primitives.dll.so => 96
	i64 u0xf8dacc6dd9573437, ; 1111: Square.OkIO.dll => 220
	i64 u0xf8e045dc345b2ea3, ; 1112: lib_Xamarin.AndroidX.RecyclerView.dll.so => 286
	i64 u0xf915dc29808193a1, ; 1113: System.Web.HttpUtility.dll => 153
	i64 u0xf96c777a2a0686f4, ; 1114: hi/Microsoft.Maui.Controls.resources.dll => 358
	i64 u0xf9be54c8bcf8ff3b, ; 1115: System.Security.AccessControl.dll => 118
	i64 u0xf9eec5bb3a6aedc6, ; 1116: Microsoft.Extensions.Options => 204
	i64 u0xfa0e82300e67f913, ; 1117: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1118: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1119: lib_System.Net.Security.dll.so => 74
	i64 u0xfa5ed7226d978949, ; 1120: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 348
	i64 u0xfa645d91e9fc4cba, ; 1121: System.Threading.Thread => 146
	i64 u0xfa99d44ebf9bea5b, ; 1122: SkiaSharp.Views.Maui.Core => 218
	i64 u0xfad4d2c770e827f9, ; 1123: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 1124: System.Net.Ping.dll => 70
	i64 u0xfb087abe5365e3b7, ; 1125: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb3cb754cb2d9fc0, ; 1126: lib_Plugin.LocalNotification.dll.so => 213
	i64 u0xfb846e949baff5ea, ; 1127: System.Xml.Serialization.dll => 158
	i64 u0xfbad3e4ce4b98145, ; 1128: System.Security.Cryptography.X509Certificates => 126
	i64 u0xfbf0a31c9fc34bc4, ; 1129: lib_System.Net.Http.dll.so => 65
	i64 u0xfc61ddcf78dd1f54, ; 1130: Xamarin.AndroidX.LocalBroadcastManager => 279
	i64 u0xfc6b7527cc280b3f, ; 1131: lib_System.Runtime.Serialization.Formatters.dll.so => 112
	i64 u0xfc719aec26adf9d9, ; 1132: Xamarin.AndroidX.Navigation.Fragment.dll => 281
	i64 u0xfc82690c2fe2735c, ; 1133: Xamarin.AndroidX.Lifecycle.Process.dll => 268
	i64 u0xfc93fc307d279893, ; 1134: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 1135: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd22f00870e40ae0, ; 1136: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 254
	i64 u0xfd3ce7bc9232d417, ; 1137: Xamarin.Firebase.Firestore.dll => 310
	i64 u0xfd49b3c1a76e2748, ; 1138: System.Runtime.InteropServices.RuntimeInformation => 107
	i64 u0xfd536c702f64dc47, ; 1139: System.Text.Encoding.Extensions => 135
	i64 u0xfd583f7657b6a1cb, ; 1140: Xamarin.AndroidX.Fragment => 259
	i64 u0xfd8dd91a2c26bd5d, ; 1141: Xamarin.AndroidX.Lifecycle.Runtime => 269
	i64 u0xfda36abccf05cf5c, ; 1142: System.Net.WebSockets.Client => 80
	i64 u0xfddbe9695626a7f5, ; 1143: Xamarin.AndroidX.Lifecycle.Common => 263
	i64 u0xfeae9952cf03b8cb, ; 1144: tr/Microsoft.Maui.Controls.resources => 376
	i64 u0xfebe1950717515f9, ; 1145: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 267
	i64 u0xff270a55858bac8d, ; 1146: System.Security.Principal => 129
	i64 u0xff9b54613e0d2cc8, ; 1147: System.Net.Http.Json => 64
	i64 u0xffdb7a971be4ec73 ; 1148: System.ValueTuple.dll => 152
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1149 x i32] [
	i32 185, i32 42, i32 343, i32 294, i32 13, i32 192, i32 282, i32 105,
	i32 171, i32 48, i32 234, i32 7, i32 86, i32 372, i32 350, i32 378,
	i32 255, i32 332, i32 71, i32 329, i32 286, i32 12, i32 208, i32 102,
	i32 379, i32 156, i32 19, i32 260, i32 241, i32 161, i32 257, i32 298,
	i32 167, i32 372, i32 10, i32 203, i32 299, i32 96, i32 252, i32 254,
	i32 13, i32 204, i32 10, i32 325, i32 127, i32 308, i32 95, i32 176,
	i32 140, i32 39, i32 373, i32 346, i32 301, i32 221, i32 369, i32 172,
	i32 228, i32 5, i32 209, i32 67, i32 291, i32 130, i32 196, i32 191,
	i32 290, i32 256, i32 0, i32 68, i32 313, i32 216, i32 242, i32 66,
	i32 57, i32 196, i32 251, i32 52, i32 43, i32 125, i32 67, i32 81,
	i32 271, i32 158, i32 92, i32 99, i32 286, i32 177, i32 141, i32 311,
	i32 185, i32 151, i32 238, i32 356, i32 162, i32 169, i32 357, i32 305,
	i32 200, i32 81, i32 340, i32 242, i32 4, i32 5, i32 51, i32 101,
	i32 336, i32 56, i32 337, i32 120, i32 98, i32 168, i32 118, i32 343,
	i32 21, i32 360, i32 137, i32 97, i32 346, i32 77, i32 366, i32 284,
	i32 293, i32 119, i32 222, i32 8, i32 165, i32 375, i32 70, i32 227,
	i32 272, i32 287, i32 171, i32 182, i32 145, i32 40, i32 291, i32 47,
	i32 188, i32 30, i32 322, i32 283, i32 364, i32 144, i32 204, i32 163,
	i32 28, i32 84, i32 295, i32 77, i32 43, i32 179, i32 29, i32 42,
	i32 103, i32 117, i32 195, i32 335, i32 232, i32 45, i32 91, i32 375,
	i32 56, i32 214, i32 148, i32 325, i32 146, i32 100, i32 49, i32 179,
	i32 20, i32 247, i32 114, i32 309, i32 190, i32 182, i32 225, i32 356,
	i32 318, i32 341, i32 205, i32 310, i32 94, i32 58, i32 361, i32 359,
	i32 81, i32 318, i32 169, i32 26, i32 314, i32 330, i32 71, i32 311,
	i32 285, i32 214, i32 215, i32 258, i32 377, i32 69, i32 33, i32 355,
	i32 14, i32 139, i32 38, i32 337, i32 381, i32 243, i32 368, i32 134,
	i32 92, i32 88, i32 149, i32 322, i32 374, i32 24, i32 309, i32 138,
	i32 57, i32 51, i32 353, i32 29, i32 157, i32 34, i32 164, i32 309,
	i32 328, i32 259, i32 52, i32 175, i32 382, i32 303, i32 90, i32 320,
	i32 239, i32 35, i32 217, i32 356, i32 157, i32 9, i32 354, i32 186,
	i32 76, i32 333, i32 55, i32 208, i32 350, i32 347, i32 206, i32 13,
	i32 302, i32 197, i32 236, i32 109, i32 335, i32 275, i32 32, i32 308,
	i32 104, i32 84, i32 92, i32 53, i32 96, i32 339, i32 180, i32 58,
	i32 9, i32 102, i32 251, i32 68, i32 327, i32 301, i32 224, i32 349,
	i32 224, i32 211, i32 125, i32 287, i32 116, i32 135, i32 289, i32 126,
	i32 106, i32 187, i32 341, i32 131, i32 334, i32 306, i32 238, i32 323,
	i32 147, i32 156, i32 260, i32 247, i32 188, i32 255, i32 187, i32 287,
	i32 97, i32 24, i32 292, i32 194, i32 143, i32 284, i32 280, i32 218,
	i32 3, i32 180, i32 167, i32 235, i32 100, i32 161, i32 184, i32 99,
	i32 178, i32 249, i32 25, i32 223, i32 93, i32 168, i32 172, i32 230,
	i32 3, i32 368, i32 296, i32 257, i32 1, i32 114, i32 341, i32 260,
	i32 268, i32 181, i32 33, i32 6, i32 372, i32 338, i32 156, i32 193,
	i32 370, i32 53, i32 262, i32 85, i32 307, i32 300, i32 347, i32 283,
	i32 44, i32 267, i32 104, i32 47, i32 138, i32 216, i32 277, i32 64,
	i32 278, i32 69, i32 80, i32 59, i32 89, i32 154, i32 236, i32 133,
	i32 110, i32 362, i32 278, i32 285, i32 171, i32 134, i32 140, i32 40,
	i32 349, i32 330, i32 206, i32 193, i32 328, i32 177, i32 60, i32 174,
	i32 274, i32 306, i32 79, i32 25, i32 36, i32 99, i32 271, i32 71,
	i32 193, i32 22, i32 247, i32 210, i32 373, i32 121, i32 69, i32 107,
	i32 379, i32 279, i32 119, i32 117, i32 263, i32 183, i32 264, i32 11,
	i32 2, i32 124, i32 218, i32 115, i32 142, i32 41, i32 87, i32 322,
	i32 231, i32 173, i32 27, i32 148, i32 363, i32 199, i32 319, i32 230,
	i32 1, i32 190, i32 232, i32 334, i32 44, i32 246, i32 149, i32 262,
	i32 18, i32 321, i32 86, i32 217, i32 351, i32 324, i32 41, i32 267,
	i32 240, i32 272, i32 94, i32 201, i32 28, i32 41, i32 78, i32 256,
	i32 243, i32 144, i32 108, i32 241, i32 312, i32 11, i32 105, i32 137,
	i32 16, i32 122, i32 66, i32 157, i32 22, i32 353, i32 345, i32 102,
	i32 199, i32 344, i32 312, i32 63, i32 58, i32 207, i32 352, i32 110,
	i32 173, i32 306, i32 321, i32 342, i32 9, i32 316, i32 120, i32 98,
	i32 105, i32 275, i32 195, i32 206, i32 111, i32 233, i32 49, i32 20,
	i32 274, i32 250, i32 72, i32 245, i32 155, i32 39, i32 351, i32 35,
	i32 38, i32 357, i32 304, i32 108, i32 194, i32 366, i32 21, i32 347,
	i32 181, i32 339, i32 194, i32 273, i32 210, i32 15, i32 205, i32 79,
	i32 79, i32 250, i32 205, i32 253, i32 281, i32 290, i32 152, i32 21,
	i32 313, i32 208, i32 350, i32 50, i32 51, i32 333, i32 376, i32 212,
	i32 366, i32 94, i32 226, i32 362, i32 16, i32 249, i32 123, i32 359,
	i32 160, i32 45, i32 319, i32 189, i32 116, i32 63, i32 166, i32 213,
	i32 197, i32 14, i32 288, i32 111, i32 233, i32 177, i32 60, i32 338,
	i32 121, i32 365, i32 2, i32 375, i32 307, i32 259, i32 273, i32 219,
	i32 327, i32 340, i32 273, i32 6, i32 240, i32 355, i32 255, i32 17,
	i32 373, i32 352, i32 77, i32 244, i32 325, i32 131, i32 339, i32 365,
	i32 83, i32 203, i32 12, i32 34, i32 119, i32 345, i32 268, i32 334,
	i32 257, i32 85, i32 225, i32 329, i32 18, i32 301, i32 198, i32 266,
	i32 72, i32 95, i32 165, i32 261, i32 185, i32 82, i32 381, i32 234,
	i32 239, i32 154, i32 36, i32 151, i32 377, i32 380, i32 144, i32 56,
	i32 113, i32 215, i32 240, i32 298, i32 332, i32 297, i32 37, i32 212,
	i32 381, i32 197, i32 115, i32 232, i32 14, i32 226, i32 335, i32 315,
	i32 146, i32 43, i32 192, i32 209, i32 230, i32 305, i32 98, i32 344,
	i32 168, i32 16, i32 289, i32 48, i32 107, i32 97, i32 184, i32 278,
	i32 27, i32 128, i32 29, i32 357, i32 315, i32 290, i32 128, i32 44,
	i32 250, i32 256, i32 149, i32 8, i32 191, i32 219, i32 296, i32 211,
	i32 280, i32 358, i32 371, i32 329, i32 370, i32 132, i32 369, i32 42,
	i32 345, i32 332, i32 33, i32 382, i32 46, i32 143, i32 274, i32 207,
	i32 265, i32 251, i32 138, i32 62, i32 132, i32 349, i32 48, i32 160,
	i32 308, i32 237, i32 265, i32 226, i32 263, i32 326, i32 365, i32 297,
	i32 46, i32 164, i32 261, i32 354, i32 258, i32 183, i32 361, i32 210,
	i32 324, i32 175, i32 18, i32 8, i32 305, i32 189, i32 248, i32 289,
	i32 124, i32 59, i32 141, i32 174, i32 282, i32 364, i32 269, i32 212,
	i32 317, i32 303, i32 150, i32 142, i32 343, i32 126, i32 342, i32 314,
	i32 160, i32 162, i32 252, i32 229, i32 198, i32 367, i32 26, i32 280,
	i32 214, i32 266, i32 338, i32 213, i32 82, i32 175, i32 303, i32 127,
	i32 318, i32 101, i32 148, i32 316, i32 176, i32 283, i32 54, i32 162,
	i32 216, i32 167, i32 131, i32 37, i32 299, i32 364, i32 174, i32 22,
	i32 112, i32 90, i32 253, i32 50, i32 60, i32 122, i32 83, i32 127,
	i32 222, i32 163, i32 317, i32 166, i32 288, i32 291, i32 254, i32 225,
	i32 270, i32 4, i32 264, i32 360, i32 170, i32 2, i32 324, i32 275,
	i32 116, i32 231, i32 178, i32 19, i32 202, i32 89, i32 65, i32 30,
	i32 200, i32 353, i32 184, i32 245, i32 59, i32 111, i32 266, i32 32,
	i32 188, i32 128, i32 159, i32 371, i32 313, i32 243, i32 140, i32 253,
	i32 367, i32 153, i32 17, i32 242, i32 228, i32 75, i32 74, i32 15,
	i32 169, i32 85, i32 124, i32 265, i32 276, i32 244, i32 374, i32 272,
	i32 34, i32 118, i32 139, i32 122, i32 106, i32 351, i32 312, i32 299,
	i32 179, i32 239, i32 315, i32 186, i32 358, i32 348, i32 54, i32 47,
	i32 28, i32 145, i32 202, i32 147, i32 35, i32 374, i32 173, i32 223,
	i32 304, i32 75, i32 161, i32 191, i32 1, i32 277, i32 292, i32 370,
	i32 363, i32 159, i32 12, i32 155, i32 151, i32 180, i32 76, i32 103,
	i32 112, i32 331, i32 236, i32 65, i32 66, i32 302, i32 45, i32 238,
	i32 219, i32 109, i32 328, i32 7, i32 235, i32 55, i32 231, i32 64,
	i32 348, i32 248, i32 20, i32 109, i32 101, i32 62, i32 190, i32 142,
	i32 229, i32 336, i32 7, i32 183, i32 363, i32 170, i32 50, i32 302,
	i32 115, i32 141, i32 189, i32 166, i32 80, i32 326, i32 113, i32 276,
	i32 17, i32 73, i32 281, i32 89, i32 227, i32 87, i32 120, i32 182,
	i32 295, i32 337, i32 310, i32 233, i32 195, i32 0, i32 135, i32 153,
	i32 106, i32 11, i32 90, i32 311, i32 31, i32 376, i32 136, i32 368,
	i32 320, i32 371, i32 293, i32 224, i32 228, i32 40, i32 382, i32 292,
	i32 196, i32 139, i32 344, i32 346, i32 25, i32 380, i32 73, i32 0,
	i32 261, i32 294, i32 27, i32 67, i32 88, i32 95, i32 113, i32 31,
	i32 104, i32 264, i32 37, i32 72, i32 336, i32 323, i32 108, i32 123,
	i32 235, i32 87, i32 201, i32 86, i32 362, i32 93, i32 200, i32 129,
	i32 276, i32 295, i32 203, i32 187, i32 288, i32 248, i32 294, i32 245,
	i32 333, i32 320, i32 317, i32 198, i32 163, i32 130, i32 202, i32 220,
	i32 300, i32 221, i32 285, i32 199, i32 10, i32 49, i32 330, i32 378,
	i32 91, i32 217, i32 378, i32 150, i32 62, i32 136, i32 150, i32 61,
	i32 181, i32 201, i32 117, i32 137, i32 340, i32 84, i32 262, i32 380,
	i32 159, i32 297, i32 143, i32 359, i32 258, i32 82, i32 70, i32 234,
	i32 136, i32 246, i32 227, i32 125, i32 314, i32 54, i32 110, i32 130,
	i32 88, i32 23, i32 74, i32 129, i32 31, i32 73, i32 271, i32 361,
	i32 158, i32 23, i32 4, i32 170, i32 369, i32 123, i32 249, i32 327,
	i32 360, i32 186, i32 355, i32 114, i32 172, i32 32, i32 3, i32 164,
	i32 178, i32 222, i32 298, i32 30, i32 19, i32 270, i32 93, i32 36,
	i32 5, i32 321, i32 331, i32 304, i32 237, i32 192, i32 342, i32 155,
	i32 293, i32 319, i32 223, i32 244, i32 279, i32 326, i32 307, i32 300,
	i32 76, i32 63, i32 282, i32 147, i32 241, i32 121, i32 134, i32 284,
	i32 296, i32 323, i32 209, i32 100, i32 39, i32 229, i32 221, i32 354,
	i32 68, i32 26, i32 75, i32 78, i32 269, i32 207, i32 24, i32 152,
	i32 38, i32 277, i32 367, i32 237, i32 133, i32 103, i32 316, i32 57,
	i32 165, i32 91, i32 61, i32 132, i32 215, i32 331, i32 46, i32 133,
	i32 252, i32 145, i32 78, i32 246, i32 270, i32 154, i32 220, i32 352,
	i32 83, i32 379, i32 211, i32 377, i32 176, i32 61, i32 96, i32 220,
	i32 286, i32 153, i32 358, i32 118, i32 204, i32 6, i32 15, i32 74,
	i32 348, i32 146, i32 218, i32 52, i32 70, i32 23, i32 213, i32 158,
	i32 126, i32 65, i32 279, i32 112, i32 281, i32 268, i32 55, i32 53,
	i32 254, i32 310, i32 107, i32 135, i32 259, i32 269, i32 80, i32 263,
	i32 376, i32 267, i32 129, i32 64, i32 152
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 9abff7703206541fdb83ffa80fe2c2753ad1997b"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
