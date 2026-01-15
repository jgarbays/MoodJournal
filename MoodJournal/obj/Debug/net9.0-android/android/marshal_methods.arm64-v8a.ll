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

@assembly_image_cache = dso_local local_unnamed_addr global [388 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1164 x i64] [
	i64 u0x0010bf7088f76c5f, ; 0: Google.Cloud.Firestore.V1 => 185
	i64 u0x001e58127c546039, ; 1: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 2: Xamarin.KotlinX.Coroutines.Core.dll => 344
	i64 u0x0071cf2d27b7d61e, ; 3: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 295
	i64 u0x01109b0e4d99e61f, ; 4: System.ComponentModel.Annotations.dll => 13
	i64 u0x020f428300334897, ; 5: Grpc.Net.Client.dll => 192
	i64 u0x02123411c4e01926, ; 6: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 282
	i64 u0x0284512fad379f7e, ; 7: System.Runtime.Handles => 105
	i64 u0x02abedc11addc1ed, ; 8: lib_Mono.Android.Runtime.dll.so => 171
	i64 u0x02f55bf70672f5c8, ; 9: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 10: lib_Xamarin.AndroidX.AppCompat.dll.so => 234
	i64 u0x03621c804933a890, ; 11: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 12: lib_System.Private.DataContractSerialization.dll.so => 86
	i64 u0x043032f1d071fae0, ; 13: ru/Microsoft.Maui.Controls.resources => 373
	i64 u0x044440a55165631e, ; 14: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 351
	i64 u0x046eb1581a80c6b0, ; 15: vi/Microsoft.Maui.Controls.resources => 379
	i64 u0x047408741db2431a, ; 16: Xamarin.AndroidX.DynamicAnimation => 255
	i64 u0x04acae429ea0efac, ; 17: Xamarin.Grpc.Context => 333
	i64 u0x0517ef04e06e9f76, ; 18: System.Net.Primitives => 71
	i64 u0x051a3be159e4ef99, ; 19: Xamarin.GooglePlayServices.Tasks => 330
	i64 u0x0565d18c6da3de38, ; 20: Xamarin.AndroidX.RecyclerView => 288
	i64 u0x0581db89237110e9, ; 21: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 22: Microsoft.Maui.dll => 208
	i64 u0x05a1c25e78e22d87, ; 23: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 102
	i64 u0x06076b5d2b581f08, ; 24: zh-HK/Microsoft.Maui.Controls.resources => 380
	i64 u0x06388ffe9f6c161a, ; 25: System.Xml.Linq.dll => 156
	i64 u0x06600c4c124cb358, ; 26: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 27: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 260
	i64 u0x0680a433c781bb3d, ; 28: Xamarin.AndroidX.Collection.Jvm => 241
	i64 u0x069fff96ec92a91d, ; 29: System.Xml.XPath.dll => 161
	i64 u0x070b0847e18dab68, ; 30: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 257
	i64 u0x0739448d84d3b016, ; 31: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 299
	i64 u0x07469f2eecce9e85, ; 32: mscorlib.dll => 167
	i64 u0x07c57877c7ba78ad, ; 33: ru/Microsoft.Maui.Controls.resources.dll => 373
	i64 u0x07dcdc7460a0c5e4, ; 34: System.Collections.NonGeneric => 10
	i64 u0x08122e52765333c8, ; 35: lib_Microsoft.Extensions.Logging.Debug.dll.so => 203
	i64 u0x088610fc2509f69e, ; 36: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 300
	i64 u0x08a7c865576bbde7, ; 37: System.Reflection.Primitives => 96
	i64 u0x08c9d051a4a817e5, ; 38: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 252
	i64 u0x08f3c9788ee2153c, ; 39: Xamarin.AndroidX.DrawerLayout => 254
	i64 u0x09138715c92dba90, ; 40: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 41: lib_Microsoft.Extensions.Options.dll.so => 204
	i64 u0x092266563089ae3e, ; 42: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x098b50f911ccea8d, ; 43: lib_Xamarin.GooglePlayServices.Basement.dll.so => 326
	i64 u0x09d144a7e214d457, ; 44: System.Security.Cryptography => 127
	i64 u0x09da6dfc3439e851, ; 45: lib_Xamarin.Firebase.Components.dll.so => 309
	i64 u0x09e2b9f743db21a8, ; 46: lib_System.Reflection.Metadata.dll.so => 95
	i64 u0x0a066c5968b04c8d, ; 47: lib_Firebase.dll.so => 176
	i64 u0x0abb3e2b271edc45, ; 48: System.Threading.Channels.dll => 140
	i64 u0x0b06b1feab070143, ; 49: System.Formats.Tar => 39
	i64 u0x0b3b632c3bbee20c, ; 50: sk/Microsoft.Maui.Controls.resources => 374
	i64 u0x0b6aff547b84fbe9, ; 51: Xamarin.KotlinX.Serialization.Core.Jvm => 347
	i64 u0x0be2e1f8ce4064ed, ; 52: Xamarin.AndroidX.ViewPager => 302
	i64 u0x0c279376b1ae96ae, ; 53: lib_System.CodeDom.dll.so => 221
	i64 u0x0c3ca6cc978e2aae, ; 54: pt-BR/Microsoft.Maui.Controls.resources => 370
	i64 u0x0c59ad9fbbd43abe, ; 55: Mono.Android => 172
	i64 u0x0c65741e86371ee3, ; 56: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 228
	i64 u0x0c74af560004e816, ; 57: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 58: lib_Microsoft.Maui.Essentials.dll.so => 209
	i64 u0x0c83c82812e96127, ; 59: lib_System.Net.Mail.dll.so => 67
	i64 u0x0cce4bce83380b7f, ; 60: Xamarin.AndroidX.Security.SecurityCrypto => 292
	i64 u0x0d13cd7cce4284e4, ; 61: System.Security.SecureString => 130
	i64 u0x0d3b5ab8b2766190, ; 62: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 196
	i64 u0x0d565cb22b8879da, ; 63: lib_Grpc.Core.Api.dll.so => 191
	i64 u0x0e04e702012f8463, ; 64: Xamarin.AndroidX.Emoji2 => 256
	i64 u0x0e1489f4c773c237, ; 65: lib_MoodJournal.dll.so => 0
	i64 u0x0e14e73a54dda68e, ; 66: lib_System.Net.NameResolution.dll.so => 68
	i64 u0x0e5f1ca7132adebb, ; 67: Xamarin.Firebase.Installations.dll => 314
	i64 u0x0ec01b05613190b9, ; 68: SkiaSharp.Views.Android.dll => 216
	i64 u0x0f37dd7a62ae99af, ; 69: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 242
	i64 u0x0f5e7abaa7cf470a, ; 70: System.Net.HttpListener => 66
	i64 u0x1001f97bbe242e64, ; 71: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102861e4055f511a, ; 72: Microsoft.Bcl.AsyncInterfaces.dll => 196
	i64 u0x102a31b45304b1da, ; 73: Xamarin.AndroidX.CustomView => 251
	i64 u0x1065c4cb554c3d75, ; 74: System.IO.IsolatedStorage.dll => 52
	i64 u0x10f6cfcbcf801616, ; 75: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 76: System.Security.Cryptography.Primitives => 125
	i64 u0x11a603952763e1d4, ; 77: System.Net.Mail => 67
	i64 u0x11a70d0e1009fb11, ; 78: System.Net.WebSockets.dll => 81
	i64 u0x11f26371eee0d3c1, ; 79: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 271
	i64 u0x11fbe62d469cc1c8, ; 80: Microsoft.VisualStudio.DesignTools.TapContract.dll => 385
	i64 u0x12128b3f59302d47, ; 81: lib_System.Xml.Serialization.dll.so => 158
	i64 u0x123639456fb056da, ; 82: System.Reflection.Emit.Lightweight.dll => 92
	i64 u0x12521e9764603eaa, ; 83: lib_System.Resources.Reader.dll.so => 99
	i64 u0x125b7f94acb989db, ; 84: Xamarin.AndroidX.RecyclerView.dll => 288
	i64 u0x12602de9d0de1ebb, ; 85: lib_Firebase.Storage.dll.so => 177
	i64 u0x12d3b63863d4ab0b, ; 86: lib_System.Threading.Overlapped.dll.so => 141
	i64 u0x12db68ac7e4d099f, ; 87: lib_Xamarin.Firebase.Iid.dll.so => 312
	i64 u0x12f23aabd624cf79, ; 88: lib_Google.Cloud.Firestore.V1.dll.so => 185
	i64 u0x134eab1061c395ee, ; 89: System.Transactions => 151
	i64 u0x138567fa954faa55, ; 90: Xamarin.AndroidX.Browser => 238
	i64 u0x13a01de0cbc3f06c, ; 91: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 357
	i64 u0x13beedefb0e28a45, ; 92: lib_System.Xml.XmlDocument.dll.so => 162
	i64 u0x13f1e5e209e91af4, ; 93: lib_Java.Interop.dll.so => 169
	i64 u0x13f1e880c25d96d1, ; 94: he/Microsoft.Maui.Controls.resources => 358
	i64 u0x1403071365bcd83a, ; 95: Xamarin.Firebase.Annotations => 306
	i64 u0x143d8ea60a6a4011, ; 96: Microsoft.Extensions.DependencyInjection.Abstractions => 200
	i64 u0x1497051b917530bd, ; 97: lib_System.Net.WebSockets.dll.so => 81
	i64 u0x14b78ce3adce0011, ; 98: Microsoft.VisualStudio.DesignTools.TapContract => 385
	i64 u0x14d612a531c79c05, ; 99: Xamarin.JSpecify.dll => 341
	i64 u0x14e68447938213b7, ; 100: Xamarin.AndroidX.Collection.Ktx.dll => 242
	i64 u0x152a448bd1e745a7, ; 101: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 102: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x15bdc156ed462f2f, ; 103: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 104: System.Resources.Writer.dll => 101
	i64 u0x16726eac78495e6d, ; 105: Xamarin.Grpc.Stub => 337
	i64 u0x16bf2a22df043a09, ; 106: System.IO.Pipes.dll => 56
	i64 u0x16c9d17b90a80fc1, ; 107: lib_Xamarin.Io.OpenCensus.OpenCensusApi.dll.so => 338
	i64 u0x16ea2b318ad2d830, ; 108: System.Security.Cryptography.Algorithms => 120
	i64 u0x16eeae54c7ebcc08, ; 109: System.Reflection.dll => 98
	i64 u0x17125c9a85b4929f, ; 110: lib_netstandard.dll.so => 168
	i64 u0x1716866f7416792e, ; 111: lib_System.Security.AccessControl.dll.so => 118
	i64 u0x174f71c46216e44a, ; 112: Xamarin.KotlinX.Coroutines.Core => 344
	i64 u0x1752c12f1e1fc00c, ; 113: System.Core => 21
	i64 u0x17b56e25558a5d36, ; 114: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 361
	i64 u0x17f9358913beb16a, ; 115: System.Text.Encodings.Web => 137
	i64 u0x1809fb23f29ba44a, ; 116: lib_System.Reflection.TypeExtensions.dll.so => 97
	i64 u0x18402a709e357f3b, ; 117: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 347
	i64 u0x18a9befae51bb361, ; 118: System.Net.WebClient => 77
	i64 u0x18f0ce884e87d89a, ; 119: nb/Microsoft.Maui.Controls.resources.dll => 367
	i64 u0x193d7a04b7eda8bc, ; 120: lib_Xamarin.AndroidX.Print.dll.so => 286
	i64 u0x19777fba3c41b398, ; 121: Xamarin.AndroidX.Startup.StartupRuntime.dll => 294
	i64 u0x19a4c090f14ebb66, ; 122: System.Security.Claims => 119
	i64 u0x1a539258f88190d6, ; 123: lib_System.Linq.Async.dll.so => 222
	i64 u0x1a91866a319e9259, ; 124: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 125: lib_System.dll.so => 165
	i64 u0x1aad60783ffa3e5b, ; 126: lib-th-Microsoft.Maui.Controls.resources.dll.so => 376
	i64 u0x1aea8f1c3b282172, ; 127: lib_System.Net.Ping.dll.so => 70
	i64 u0x1b4b7a1d0d265fa2, ; 128: Xamarin.Android.Glide.DiskLruCache => 227
	i64 u0x1bbdb16cfa73e785, ; 129: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 272
	i64 u0x1bc766e07b2b4241, ; 130: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 289
	i64 u0x1c753b5ff15bce1b, ; 131: Mono.Android.Runtime.dll => 171
	i64 u0x1cb6a0ededc839e2, ; 132: lib_Google.Apis.Auth.dll.so => 182
	i64 u0x1cd47467799d8250, ; 133: System.Threading.Tasks.dll => 145
	i64 u0x1d23eafdc6dc346c, ; 134: System.Globalization.Calendars.dll => 40
	i64 u0x1da4110562816681, ; 135: Xamarin.AndroidX.Security.SecurityCrypto.dll => 292
	i64 u0x1db6820994506bf5, ; 136: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dba6509cc55b56f, ; 137: lib_Google.Protobuf.dll.so => 188
	i64 u0x1dbb0c2c6a999acb, ; 138: System.Diagnostics.StackTrace => 30
	i64 u0x1dcda680b17dc5bb, ; 139: lib_Xamarin.Google.Guava.FailureAccess.dll.so => 323
	i64 u0x1e3d87657e9659bc, ; 140: Xamarin.AndroidX.Navigation.UI => 283
	i64 u0x1e71143913d56c10, ; 141: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 365
	i64 u0x1e7c31185e2fb266, ; 142: lib_System.Threading.Tasks.Parallel.dll.so => 144
	i64 u0x1ed8fcce5e9b50a0, ; 143: Microsoft.Extensions.Options.dll => 204
	i64 u0x1f055d15d807e1b2, ; 144: System.Xml.XmlSerializer => 163
	i64 u0x1f1ed22c1085f044, ; 145: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 146: lib_System.Numerics.dll.so => 84
	i64 u0x1f750bb5421397de, ; 147: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 296
	i64 u0x20237ea48006d7a8, ; 148: lib_System.Net.WebClient.dll.so => 77
	i64 u0x209375905fcc1bad, ; 149: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20e085517023eec8, ; 150: lib_Google.Api.Gax.dll.so => 179
	i64 u0x20fab3cf2dfbc8df, ; 151: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 152: System.Globalization => 42
	i64 u0x21419508838f7547, ; 153: System.Runtime.CompilerServices.VisualC => 103
	i64 u0x2174319c0d835bc9, ; 154: System.Runtime => 117
	i64 u0x21846dffb992e05b, ; 155: lib_Microcharts.Maui.dll.so => 195
	i64 u0x218ae22aa3ec33e7, ; 156: Xamarin.Grpc.Protobuf.Lite.dll => 336
	i64 u0x2198e5bc8b7153fa, ; 157: Xamarin.AndroidX.Annotation.Experimental.dll => 232
	i64 u0x219ea1b751a4dee4, ; 158: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 159: System.Reflection.Emit.ILGeneration => 91
	i64 u0x220fd4f2e7c48170, ; 160: th/Microsoft.Maui.Controls.resources => 376
	i64 u0x224538d85ed15a82, ; 161: System.IO.Pipes => 56
	i64 u0x22668b177c6cedef, ; 162: Plugin.Maui.Calendar.dll => 214
	i64 u0x22908438c6bed1af, ; 163: lib_System.Threading.Timer.dll.so => 148
	i64 u0x22fbc14e981e3b45, ; 164: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 384
	i64 u0x2347c268e3e4e536, ; 165: Xamarin.GooglePlayServices.Basement.dll => 326
	i64 u0x237be844f1f812c7, ; 166: System.Threading.Thread.dll => 146
	i64 u0x23852b3bdc9f7096, ; 167: System.Resources.ResourceManager => 100
	i64 u0x23986dd7e5d4fc01, ; 168: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x23b0dd507a933aa9, ; 169: Google.Api.Gax => 179
	i64 u0x2407aef2bbe8fadf, ; 170: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 171: Xamarin.AndroidX.Core.dll => 247
	i64 u0x247619fe4413f8bf, ; 172: System.Runtime.Serialization.Primitives.dll => 114
	i64 u0x24b87318591adabe, ; 173: lib_Xamarin.Firebase.Database.Collection.dll.so => 310
	i64 u0x24b95d581a70fbee, ; 174: Grpc.Auth.dll => 190
	i64 u0x24d4238047d7310f, ; 175: Google.Apis.Auth => 182
	i64 u0x24de8d301281575e, ; 176: Xamarin.Android.Glide => 225
	i64 u0x252073cc3caa62c2, ; 177: fr/Microsoft.Maui.Controls.resources.dll => 357
	i64 u0x256b8d41255f01b1, ; 178: Xamarin.Google.Crypto.Tink.Android => 319
	i64 u0x2662c629b96b0b30, ; 179: lib_Xamarin.Kotlin.StdLib.dll.so => 342
	i64 u0x268c1439f13bcc29, ; 180: lib_Microsoft.Extensions.Primitives.dll.so => 205
	i64 u0x26918e5f13c8fc7c, ; 181: Xamarin.Firebase.Firestore => 311
	i64 u0x26a670e154a9c54b, ; 182: System.Reflection.Extensions.dll => 94
	i64 u0x26d077d9678fe34f, ; 183: System.IO.dll => 58
	i64 u0x273f3515de5faf0d, ; 184: id/Microsoft.Maui.Controls.resources.dll => 362
	i64 u0x2742545f9094896d, ; 185: hr/Microsoft.Maui.Controls.resources => 360
	i64 u0x2759af78ab94d39b, ; 186: System.Net.WebSockets => 81
	i64 u0x27b2b16f3e9de038, ; 187: Xamarin.Google.Crypto.Tink.Android.dll => 319
	i64 u0x27b410442fad6cf1, ; 188: Java.Interop.dll => 169
	i64 u0x27b97e0d52c3034a, ; 189: System.Diagnostics.Debug => 26
	i64 u0x27c1227907352196, ; 190: lib_Xamarin.Firebase.Installations.InterOp.dll.so => 315
	i64 u0x27d88445c936a1af, ; 191: lib_Xamarin.Grpc.Android.dll.so => 331
	i64 u0x2801845a2c71fbfb, ; 192: System.Net.Primitives.dll => 71
	i64 u0x28457a8c23b2a129, ; 193: Xamarin.Firebase.Iid => 312
	i64 u0x286835e259162700, ; 194: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 287
	i64 u0x2881244d3aa6b873, ; 195: Plugin.Maui.Calendar => 214
	i64 u0x2927d345f3daec35, ; 196: SkiaSharp.dll => 215
	i64 u0x2949f3617a02c6b2, ; 197: Xamarin.AndroidX.ExifInterface => 258
	i64 u0x29f947844fb7fc11, ; 198: Microsoft.Maui.Controls.HotReload.Forms => 383
	i64 u0x2a128783efe70ba0, ; 199: uk/Microsoft.Maui.Controls.resources.dll => 378
	i64 u0x2a3b095612184159, ; 200: lib_System.Net.NetworkInformation.dll.so => 69
	i64 u0x2a6507a5ffabdf28, ; 201: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad156c8e1354139, ; 202: fi/Microsoft.Maui.Controls.resources => 356
	i64 u0x2ad5d6b13b7a3e04, ; 203: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 204: System.Text.RegularExpressions.dll => 139
	i64 u0x2afc1c4f898552ee, ; 205: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b0f316f4c87d83a, ; 206: Xamarin.Io.OpenCensus.OpenCensusApi => 338
	i64 u0x2b148910ed40fbf9, ; 207: zh-Hant/Microsoft.Maui.Controls.resources.dll => 382
	i64 u0x2b6989d78cba9a15, ; 208: Xamarin.AndroidX.Concurrent.Futures.dll => 243
	i64 u0x2c8bd14bb93a7d82, ; 209: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 369
	i64 u0x2cbd9262ca785540, ; 210: lib_System.Text.Encoding.CodePages.dll.so => 134
	i64 u0x2cc9e1fed6257257, ; 211: lib_System.Reflection.Emit.Lightweight.dll.so => 92
	i64 u0x2cd723e9fe623c7c, ; 212: lib_System.Private.Xml.Linq.dll.so => 88
	i64 u0x2d169d318a968379, ; 213: System.Threading.dll => 149
	i64 u0x2d1d1413dd10c597, ; 214: Xamarin.Google.Guava.FailureAccess => 323
	i64 u0x2d47774b7d993f59, ; 215: sv/Microsoft.Maui.Controls.resources.dll => 375
	i64 u0x2d5ffcae1ad0aaca, ; 216: System.Data.dll => 24
	i64 u0x2d6267ac7de1d619, ; 217: Xamarin.Firebase.Database.Collection.dll => 310
	i64 u0x2db915caf23548d2, ; 218: System.Text.Json.dll => 138
	i64 u0x2dcaa0bb15a4117a, ; 219: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e5a40c319acb800, ; 220: System.IO.FileSystem => 51
	i64 u0x2e6f1f226821322a, ; 221: el/Microsoft.Maui.Controls.resources.dll => 354
	i64 u0x2f02f94df3200fe5, ; 222: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 223: System.Xml.ReaderWriter => 157
	i64 u0x2f5911d9ba814e4e, ; 224: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 225: lib_System.Xml.dll.so => 164
	i64 u0x2fd92a71c7638cfd, ; 226: Xamarin.Firebase.Database.Collection => 310
	i64 u0x301713b5054e4388, ; 227: Xamarin.GooglePlayServices.Stats.dll => 329
	i64 u0x309ee9eeec09a71e, ; 228: lib_Xamarin.AndroidX.Fragment.dll.so => 259
	i64 u0x30c6dda129408828, ; 229: System.IO.IsolatedStorage => 52
	i64 u0x30ff0edf3d280bcd, ; 230: Firebase.Auth => 175
	i64 u0x31195fef5d8fb552, ; 231: _Microsoft.Android.Resource.Designer.dll => 387
	i64 u0x312c8ed623cbfc8d, ; 232: Xamarin.AndroidX.Window.dll => 304
	i64 u0x31496b779ed0663d, ; 233: lib_System.Reflection.DispatchProxy.dll.so => 90
	i64 u0x315f08d19390dc36, ; 234: Xamarin.Google.ErrorProne.TypeAnnotations => 321
	i64 u0x32243413e774362a, ; 235: Xamarin.AndroidX.CardView.dll => 239
	i64 u0x3235427f8d12dae1, ; 236: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x326256f7722d4fe5, ; 237: SkiaSharp.Views.Maui.Controls.dll => 217
	i64 u0x329753a17a517811, ; 238: fr/Microsoft.Maui.Controls.resources => 357
	i64 u0x32aa989ff07a84ff, ; 239: lib_System.Xml.ReaderWriter.dll.so => 157
	i64 u0x33829542f112d59b, ; 240: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 241: lib-es-Microsoft.Maui.Controls.resources.dll.so => 355
	i64 u0x33ec63a7e226adfb, ; 242: Google.Cloud.Location.dll => 186
	i64 u0x341abc357fbb4ebf, ; 243: lib_System.Net.Sockets.dll.so => 76
	i64 u0x342397b849d48e49, ; 244: Xamarin.Grpc.Core => 334
	i64 u0x3496c1e2dcaf5ecc, ; 245: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x34dfd74fe2afcf37, ; 246: Microsoft.Maui => 208
	i64 u0x34e292762d9615df, ; 247: cs/Microsoft.Maui.Controls.resources.dll => 351
	i64 u0x35080e71f38b333d, ; 248: Xamarin.Protobuf.Lite => 348
	i64 u0x3508234247f48404, ; 249: Microsoft.Maui.Controls => 206
	i64 u0x353590da528c9d22, ; 250: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 251: lib_Xamarin.AndroidX.ViewPager2.dll.so => 303
	i64 u0x355282fc1c909694, ; 252: Microsoft.Extensions.Configuration => 197
	i64 u0x3552fc5d578f0fbf, ; 253: Xamarin.AndroidX.Arch.Core.Common => 236
	i64 u0x355c649948d55d97, ; 254: lib_System.Runtime.Intrinsics.dll.so => 109
	i64 u0x356fd122ba041cb4, ; 255: lib_Xamarin.Grpc.Protobuf.Lite.dll.so => 336
	i64 u0x35ea9d1c6834bc8c, ; 256: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 275
	i64 u0x3628ab68db23a01a, ; 257: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x364703ab05867b92, ; 258: Xamarin.Firebase.Components => 309
	i64 u0x3673b042508f5b6b, ; 259: lib_System.Runtime.Extensions.dll.so => 104
	i64 u0x36740f1a8ecdc6c4, ; 260: System.Numerics => 84
	i64 u0x36b2b50fdf589ae2, ; 261: System.Reflection.Emit.Lightweight => 92
	i64 u0x36cada77dc79928b, ; 262: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 263: System.Reflection.Primitives.dll => 96
	i64 u0x376bf93e521a5417, ; 264: lib_Xamarin.Jetbrains.Annotations.dll.so => 340
	i64 u0x379e6c338e5508ad, ; 265: lib_Google.Api.Gax.Grpc.dll.so => 180
	i64 u0x37bc29f3183003b6, ; 266: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 267: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 268: System.Runtime.CompilerServices.Unsafe => 102
	i64 u0x385c17636bb6fe6e, ; 269: Xamarin.AndroidX.CustomView.dll => 251
	i64 u0x38869c811d74050e, ; 270: System.Net.NameResolution.dll => 68
	i64 u0x3889cbdca0f2c57c, ; 271: Xamarin.GooglePlayServices.Location.dll => 328
	i64 u0x393c226616977fdb, ; 272: lib_Xamarin.AndroidX.ViewPager.dll.so => 302
	i64 u0x395b3053dde89e41, ; 273: lib_System.Reactive.dll.so => 224
	i64 u0x395e37c3334cf82a, ; 274: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 350
	i64 u0x39a87563fdb248a0, ; 275: System.Reactive.dll => 224
	i64 u0x39aa39fda111d9d3, ; 276: Newtonsoft.Json => 211
	i64 u0x3ab5859054645f72, ; 277: System.Security.Cryptography.Primitives.dll => 125
	i64 u0x3ad75090c3fac0e9, ; 278: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 289
	i64 u0x3ae44ac43a1fbdbb, ; 279: System.Runtime.Serialization => 116
	i64 u0x3b860f9932505633, ; 280: lib_System.Text.Encoding.Extensions.dll.so => 135
	i64 u0x3be99b43dd39dd37, ; 281: Xamarin.AndroidX.SavedState.SavedState.Android => 291
	i64 u0x3c3aafb6b3a00bf6, ; 282: lib_System.Security.Cryptography.X509Certificates.dll.so => 126
	i64 u0x3c4049146b59aa90, ; 283: System.Runtime.InteropServices.JavaScript => 106
	i64 u0x3c51334447dec9e7, ; 284: Google.LongRunning => 187
	i64 u0x3c7c495f58ac5ee9, ; 285: Xamarin.Kotlin.StdLib => 342
	i64 u0x3c7e5ed3d5db71bb, ; 286: System.Security => 131
	i64 u0x3c90a7b70f45292a, ; 287: Xamarin.Grpc.OkHttp.dll => 335
	i64 u0x3cc1676a8781bdbc, ; 288: Xamarin.Firebase.Auth.Interop.dll => 307
	i64 u0x3cd9d281d402eb9b, ; 289: Xamarin.AndroidX.Browser.dll => 238
	i64 u0x3d1c50cc001a991e, ; 290: Xamarin.Google.Guava.ListenableFuture.dll => 324
	i64 u0x3d2b1913edfc08d7, ; 291: lib_System.Threading.ThreadPool.dll.so => 147
	i64 u0x3d46f0b995082740, ; 292: System.Xml.Linq => 156
	i64 u0x3d8a8f400514a790, ; 293: Xamarin.AndroidX.Fragment.Ktx.dll => 260
	i64 u0x3d9c2a242b040a50, ; 294: lib_Xamarin.AndroidX.Core.dll.so => 247
	i64 u0x3daa14724d8f58e8, ; 295: Google.Protobuf.dll => 188
	i64 u0x3dbb6b9f5ab90fa7, ; 296: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 255
	i64 u0x3e027e6e728d7f1c, ; 297: Google.LongRunning.dll => 187
	i64 u0x3e5441657549b213, ; 298: Xamarin.AndroidX.ResourceInspection.Annotation => 289
	i64 u0x3e57d4d195c53c2e, ; 299: System.Reflection.TypeExtensions => 97
	i64 u0x3e616ab4ed1f3f15, ; 300: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 301: Xamarin.AndroidX.SlidingPaneLayout.dll => 293
	i64 u0x3f2839b8d63653b8, ; 302: lib_LiteDB.dll.so => 194
	i64 u0x3f510adf788828dd, ; 303: System.Threading.Tasks.Extensions => 143
	i64 u0x407740ff2e914d86, ; 304: Xamarin.AndroidX.Print.dll => 286
	i64 u0x407a10bb4bf95829, ; 305: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 280
	i64 u0x40c6d9cbfdb8b9f7, ; 306: SkiaSharp.Views.Maui.Core.dll => 218
	i64 u0x40c98b6bd77346d4, ; 307: Microsoft.VisualBasic.dll => 3
	i64 u0x41406d6f37320d99, ; 308: Google.Api.Gax.Grpc.dll => 180
	i64 u0x41833cf766d27d96, ; 309: mscorlib => 167
	i64 u0x41cab042be111c34, ; 310: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 235
	i64 u0x423a9ecc4d905a88, ; 311: lib_System.Resources.ResourceManager.dll.so => 100
	i64 u0x423bf51ae7def810, ; 312: System.Xml.XPath => 161
	i64 u0x42418aba44539ffd, ; 313: Google.Cloud.Firestore => 184
	i64 u0x42462ff15ddba223, ; 314: System.Resources.Reader.dll => 99
	i64 u0x4266c67fd9a4ee79, ; 315: Google.Api.CommonProtos => 178
	i64 u0x4291015ff4e5ef71, ; 316: Xamarin.AndroidX.Core.ViewTree.dll => 249
	i64 u0x42a31b86e6ccc3f0, ; 317: System.Diagnostics.Contracts => 25
	i64 u0x42d3cd7add035099, ; 318: System.Management.dll => 223
	i64 u0x430e95b891249788, ; 319: lib_System.Reflection.Emit.dll.so => 93
	i64 u0x43375950ec7c1b6a, ; 320: netstandard.dll => 168
	i64 u0x434c4e1d9284cdae, ; 321: Mono.Android.dll => 172
	i64 u0x43505013578652a0, ; 322: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 230
	i64 u0x437d06c381ed575a, ; 323: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 324: pl/Microsoft.Maui.Controls.resources.dll => 369
	i64 u0x43c077442b230f64, ; 325: Xamarin.AndroidX.Tracing.Tracing.Android => 297
	i64 u0x43e8ca5bc927ff37, ; 326: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 257
	i64 u0x448bd33429269b19, ; 327: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 328: lib_System.Runtime.Serialization.Primitives.dll.so => 114
	i64 u0x4515080865a951a5, ; 329: Xamarin.Kotlin.StdLib.dll => 342
	i64 u0x4545802489b736b9, ; 330: Xamarin.AndroidX.Fragment.Ktx => 260
	i64 u0x454b4d1e66bb783c, ; 331: Xamarin.AndroidX.Lifecycle.Process => 268
	i64 u0x45b31d67ff6f2b8a, ; 332: lib_Google.Apis.dll.so => 181
	i64 u0x45c40276a42e283e, ; 333: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 334: System.AppContext.dll => 6
	i64 u0x46a4213bc97fe5ae, ; 335: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 373
	i64 u0x46f84b5cc9b7d78b, ; 336: Xamarin.Io.OpenCensus.OpenCensusContribGrpcMetrics.dll => 339
	i64 u0x47358bd471172e1d, ; 337: lib_System.Xml.Linq.dll.so => 156
	i64 u0x4747e19ad6a1d4bb, ; 338: Grpc.Net.Common => 193
	i64 u0x47daf4e1afbada10, ; 339: pt/Microsoft.Maui.Controls.resources => 371
	i64 u0x480c0a47dd42dd81, ; 340: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x488d293220a4fe37, ; 341: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 262
	i64 u0x49e952f19a4e2022, ; 342: System.ObjectModel => 85
	i64 u0x49f6ab815e178ca9, ; 343: lib_Xamarin.Firebase.Common.dll.so => 308
	i64 u0x49f9e6948a8131e4, ; 344: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 301
	i64 u0x4a0fc182a3c7fc42, ; 345: Xamarin.Protobuf.Lite.dll => 348
	i64 u0x4a5667b2462a664b, ; 346: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 283
	i64 u0x4a7a18981dbd56bc, ; 347: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4aa5c60350917c06, ; 348: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 267
	i64 u0x4b07a0ed0ab33ff4, ; 349: System.Runtime.Extensions.dll => 104
	i64 u0x4b576d47ac054f3c, ; 350: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 351: System.Text.Json => 138
	i64 u0x4bf547f87e5016a8, ; 352: lib_SkiaSharp.Views.Android.dll.so => 216
	i64 u0x4c2029a97af23a8d, ; 353: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android => 277
	i64 u0x4c7755cf07ad2d5f, ; 354: System.Net.Http.Json.dll => 64
	i64 u0x4cc5f15266470798, ; 355: lib_Xamarin.AndroidX.Loader.dll.so => 278
	i64 u0x4cf6f67dc77aacd2, ; 356: System.Net.NetworkInformation.dll => 69
	i64 u0x4d3183dd245425d4, ; 357: System.Net.WebSockets.Client.dll => 80
	i64 u0x4d479f968a05e504, ; 358: System.Linq.Expressions.dll => 59
	i64 u0x4d55a010ffc4faff, ; 359: System.Private.Xml => 89
	i64 u0x4d5cbe77561c5b2e, ; 360: System.Web.dll => 154
	i64 u0x4d77512dbd86ee4c, ; 361: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 236
	i64 u0x4d7793536e79c309, ; 362: System.ServiceProcess => 133
	i64 u0x4d95fccc1f67c7ca, ; 363: System.Runtime.Loader.dll => 110
	i64 u0x4dcf44c3c9b076a2, ; 364: it/Microsoft.Maui.Controls.resources.dll => 363
	i64 u0x4dd9247f1d2c3235, ; 365: Xamarin.AndroidX.Loader.dll => 278
	i64 u0x4e2aeee78e2c4a87, ; 366: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 287
	i64 u0x4e32f00cb0937401, ; 367: Mono.Android.Runtime => 171
	i64 u0x4e5eea4668ac2b18, ; 368: System.Text.Encoding.CodePages => 134
	i64 u0x4ebd0c4b82c5eefc, ; 369: lib_System.Threading.Channels.dll.so => 140
	i64 u0x4ee8eaa9c9c1151a, ; 370: System.Globalization.Calendars => 40
	i64 u0x4f21ee6ef9eb527e, ; 371: ca/Microsoft.Maui.Controls.resources => 350
	i64 u0x4ff8ea8951a69b9f, ; 372: Xamarin.Grpc.Android.dll => 331
	i64 u0x5037f0be3c28c7a3, ; 373: lib_Microsoft.Maui.Controls.dll.so => 206
	i64 u0x508c1fa6b57728d9, ; 374: Grpc.Net.Common.dll => 193
	i64 u0x50bd8cfae0f07500, ; 375: lib_Xamarin.GooglePlayServices.Stats.dll.so => 329
	i64 u0x50bf7f8c65d00454, ; 376: Firebase.Storage => 177
	i64 u0x50c3a29b21050d45, ; 377: System.Linq.Parallel.dll => 60
	i64 u0x5112ed116d87baf8, ; 378: CommunityToolkit.Mvvm => 174
	i64 u0x5131bbe80989093f, ; 379: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 274
	i64 u0x515d61d6527dac70, ; 380: lib_Xamarin.Firebase.Auth.Interop.dll.so => 307
	i64 u0x516324a5050a7e3c, ; 381: System.Net.WebProxy => 79
	i64 u0x516d6f0b21a303de, ; 382: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 383: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 384: System.Resources.Reader => 99
	i64 u0x526bb15e3c386364, ; 385: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 271
	i64 u0x526ce79eb8e90527, ; 386: lib_System.Net.Primitives.dll.so => 71
	i64 u0x5277169428c6ebf6, ; 387: lib_Grpc.Net.Common.dll.so => 193
	i64 u0x52829f00b4467c38, ; 388: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 389: Xamarin.AndroidX.Core => 247
	i64 u0x52ff996554dbf352, ; 390: Microsoft.Maui.Graphics => 210
	i64 u0x535f7e40e8fef8af, ; 391: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 374
	i64 u0x53978aac584c666e, ; 392: lib_System.Security.Cryptography.Cng.dll.so => 121
	i64 u0x53a96d5c86c9e194, ; 393: System.Net.NetworkInformation => 69
	i64 u0x53be1038a61e8d44, ; 394: System.Runtime.InteropServices.RuntimeInformation.dll => 107
	i64 u0x53c3014b9437e684, ; 395: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 380
	i64 u0x53e450ebd586f842, ; 396: lib_Xamarin.AndroidX.LocalBroadcastManager.dll.so => 279
	i64 u0x5435e6f049e9bc37, ; 397: System.Security.Claims.dll => 119
	i64 u0x54795225dd1587af, ; 398: lib_System.Runtime.dll.so => 117
	i64 u0x547a34f14e5f6210, ; 399: Xamarin.AndroidX.Lifecycle.Common.dll => 263
	i64 u0x54b42cc2b8e65a84, ; 400: Google.Apis.Core.dll => 183
	i64 u0x556e8b63b660ab8b, ; 401: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 264
	i64 u0x5588627c9a108ec9, ; 402: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 403: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 404: lib_System.Security.Cryptography.OpenSsl.dll.so => 124
	i64 u0x561449e1215a61e4, ; 405: lib_SkiaSharp.Views.Maui.Core.dll.so => 218
	i64 u0x56442b99bc64bb47, ; 406: System.Runtime.Serialization.Xml.dll => 115
	i64 u0x56a8b26e1aeae27b, ; 407: System.Threading.Tasks.Dataflow => 142
	i64 u0x56f932d61e93c07f, ; 408: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 409: System.Private.Uri => 87
	i64 u0x57201164aeb974e3, ; 410: Xamarin.Google.Guava.FailureAccess.dll => 323
	i64 u0x576499c9f52fea31, ; 411: Xamarin.AndroidX.Annotation => 231
	i64 u0x579a06fed6eec900, ; 412: System.Private.CoreLib.dll => 173
	i64 u0x57c542c14049b66d, ; 413: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 414: System.Threading.Timer => 148
	i64 u0x58601b2dda4a27b9, ; 415: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 364
	i64 u0x58688d9af496b168, ; 416: Microsoft.Extensions.DependencyInjection.dll => 199
	i64 u0x588c167a79db6bfb, ; 417: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 320
	i64 u0x5906028ae5151104, ; 418: Xamarin.AndroidX.Activity.Ktx => 230
	i64 u0x595a356d23e8da9a, ; 419: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59a935a032dbc08c, ; 420: lib_Grpc.Auth.dll.so => 190
	i64 u0x59f9e60b9475085f, ; 421: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 232
	i64 u0x5a6dc081b000c5d7, ; 422: lib_Xamarin.Grpc.OkHttp.dll.so => 335
	i64 u0x5a745f5101a75527, ; 423: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a89a886ae30258d, ; 424: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 246
	i64 u0x5a8f6699f4a1caa9, ; 425: lib_System.Threading.dll.so => 149
	i64 u0x5ae8e4f3eae4d547, ; 426: Xamarin.AndroidX.Legacy.Support.Core.Utils => 262
	i64 u0x5ae9cd33b15841bf, ; 427: System.ComponentModel => 18
	i64 u0x5aeb8cd498d4823e, ; 428: lib_Xamarin.Google.Guava.dll.so => 322
	i64 u0x5b54391bdc6fcfe6, ; 429: System.Private.DataContractSerialization => 86
	i64 u0x5b5ba1327561f926, ; 430: lib_SkiaSharp.Views.Maui.Controls.dll.so => 217
	i64 u0x5b5f0e240a06a2a2, ; 431: da/Microsoft.Maui.Controls.resources.dll => 352
	i64 u0x5b755276902c8414, ; 432: Xamarin.GooglePlayServices.Base => 325
	i64 u0x5b8109e8e14c5e3e, ; 433: System.Globalization.Extensions.dll => 41
	i64 u0x5bddd04d72a9e350, ; 434: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 267
	i64 u0x5bdf16b09da116ab, ; 435: Xamarin.AndroidX.Collection => 240
	i64 u0x5c019d5266093159, ; 436: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 272
	i64 u0x5c30a4a35f9cc8c4, ; 437: lib_System.Reflection.Extensions.dll.so => 94
	i64 u0x5c393624b8176517, ; 438: lib_Microsoft.Extensions.Logging.dll.so => 201
	i64 u0x5c53c29f5073b0c9, ; 439: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 440: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 441: System.Net.WebHeaderCollection.dll => 78
	i64 u0x5d40c9b15181641f, ; 442: lib_Xamarin.AndroidX.Emoji2.dll.so => 256
	i64 u0x5d6ca10d35e9485b, ; 443: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 243
	i64 u0x5d7ec76c1c703055, ; 444: System.Threading.Tasks.Parallel => 144
	i64 u0x5db0cbbd1028510e, ; 445: lib_System.Runtime.InteropServices.dll.so => 108
	i64 u0x5db30905d3e5013b, ; 446: Xamarin.AndroidX.Collection.Jvm.dll => 241
	i64 u0x5dd10b96620cce23, ; 447: Xamarin.Firebase.Iid.Interop => 313
	i64 u0x5e467bc8f09ad026, ; 448: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 449: System.Runtime.Handles.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 450: System.Text.Encodings.Web.dll => 137
	i64 u0x5eb8046dd40e9ac3, ; 451: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 452: System.Security.Cryptography.Csp.dll => 122
	i64 u0x5eee1376d94c7f5e, ; 453: System.Net.HttpListener.dll => 66
	i64 u0x5f36ccf5c6a57e24, ; 454: System.Xml.ReaderWriter.dll => 157
	i64 u0x5f4294b9b63cb842, ; 455: System.Data.Common => 22
	i64 u0x5f9a2d823f664957, ; 456: lib-el-Microsoft.Maui.Controls.resources.dll.so => 354
	i64 u0x5fa6da9c3cd8142a, ; 457: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 346
	i64 u0x5fac98e0b37a5b9d, ; 458: System.Runtime.CompilerServices.Unsafe.dll => 102
	i64 u0x609f4b7b63d802d4, ; 459: lib_Microsoft.Extensions.DependencyInjection.dll.so => 199
	i64 u0x60cd4e33d7e60134, ; 460: Xamarin.KotlinX.Coroutines.Core.Jvm => 345
	i64 u0x60ee72f71c4b3113, ; 461: Xamarin.Firebase.Iid.Interop.dll => 313
	i64 u0x60f62d786afcf130, ; 462: System.Memory => 63
	i64 u0x61bb78c89f867353, ; 463: System.IO => 58
	i64 u0x61be8d1299194243, ; 464: Microsoft.Maui.Controls.Xaml => 207
	i64 u0x61d2cba29557038f, ; 465: de/Microsoft.Maui.Controls.resources => 353
	i64 u0x61d88f399afb2f45, ; 466: lib_System.Runtime.Loader.dll.so => 110
	i64 u0x622eef6f9e59068d, ; 467: System.Private.CoreLib => 173
	i64 u0x62e976fd765a2339, ; 468: Xamarin.Firebase.Auth.Interop => 307
	i64 u0x63982c87366f9be8, ; 469: Xamarin.Google.Guava => 322
	i64 u0x63cdbd66ac39bb46, ; 470: lib_Microsoft.VisualStudio.DesignTools.XamlTapContract.dll.so => 386
	i64 u0x63d5e3aa4ef9b931, ; 471: Xamarin.KotlinX.Coroutines.Android.dll => 343
	i64 u0x63f1f6883c1e23c2, ; 472: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 473: Xamarin.Google.Android.Material.dll => 317
	i64 u0x640e3b14dbd325c2, ; 474: System.Security.Cryptography.Algorithms.dll => 120
	i64 u0x64587004560099b9, ; 475: System.Reflection => 98
	i64 u0x64b1529a438a3c45, ; 476: lib_System.Runtime.Handles.dll.so => 105
	i64 u0x6565fba2cd8f235b, ; 477: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 275
	i64 u0x65ca90e07a453071, ; 478: Microcharts.Maui.dll => 195
	i64 u0x65ecac39144dd3cc, ; 479: Microsoft.Maui.Controls.dll => 206
	i64 u0x65ece51227bfa724, ; 480: lib_System.Runtime.Numerics.dll.so => 111
	i64 u0x661722438787b57f, ; 481: Xamarin.AndroidX.Annotation.Jvm.dll => 233
	i64 u0x6679b2337ee6b22a, ; 482: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x6692e924eade1b29, ; 483: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 484: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 274
	i64 u0x66d13304ce1a3efa, ; 485: Xamarin.AndroidX.CursorAdapter => 250
	i64 u0x674303f65d8fad6f, ; 486: lib_System.Net.Quic.dll.so => 72
	i64 u0x6756ca4cad62e9d6, ; 487: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 245
	i64 u0x67c0802770244408, ; 488: System.Windows.dll => 155
	i64 u0x68100b69286e27cd, ; 489: lib_System.Formats.Tar.dll.so => 39
	i64 u0x68558ec653afa616, ; 490: lib-da-Microsoft.Maui.Controls.resources.dll.so => 352
	i64 u0x6872ec7a2e36b1ac, ; 491: System.Drawing.Primitives.dll => 35
	i64 u0x68fbbbe2eb455198, ; 492: System.Formats.Asn1 => 38
	i64 u0x69063fc0ba8e6bdd, ; 493: he/Microsoft.Maui.Controls.resources.dll => 358
	i64 u0x69a3e26c76f6eec4, ; 494: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 305
	i64 u0x6a4d7577b2317255, ; 495: System.Runtime.InteropServices.dll => 108
	i64 u0x6ab05716e0ac384b, ; 496: LiteDB.dll => 194
	i64 u0x6ace3b74b15ee4a4, ; 497: nb/Microsoft.Maui.Controls.resources => 367
	i64 u0x6afcedb171067e2b, ; 498: System.Core.dll => 21
	i64 u0x6b2b13561049ea2c, ; 499: lib_Xamarin.Protobuf.Lite.dll.so => 348
	i64 u0x6bc822f45373a1d6, ; 500: Google.Apis.dll => 181
	i64 u0x6bef98e124147c24, ; 501: Xamarin.Jetbrains.Annotations => 340
	i64 u0x6c07f7c8a4a1e99d, ; 502: LiteDB => 194
	i64 u0x6ce874bff138ce2b, ; 503: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 273
	i64 u0x6d12bfaa99c72b1f, ; 504: lib_Microsoft.Maui.Graphics.dll.so => 210
	i64 u0x6d70755158ca866e, ; 505: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 506: Microsoft.Extensions.Primitives => 205
	i64 u0x6d7eeca99577fc8b, ; 507: lib_System.Net.WebProxy.dll.so => 79
	i64 u0x6d8515b19946b6a2, ; 508: System.Net.WebProxy.dll => 79
	i64 u0x6d86d56b84c8eb71, ; 509: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 250
	i64 u0x6d9bea6b3e895cf7, ; 510: Microsoft.Extensions.Primitives.dll => 205
	i64 u0x6dd9bf4083de3f6a, ; 511: Xamarin.AndroidX.DocumentFile.dll => 253
	i64 u0x6e25a02c3833319a, ; 512: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 281
	i64 u0x6e838d9a2a6f6c9e, ; 513: lib_System.ValueTuple.dll.so => 152
	i64 u0x6e9965ce1095e60a, ; 514: lib_System.Core.dll.so => 21
	i64 u0x6f304d1dec1019e9, ; 515: lib_Xamarin.Firebase.Installations.dll.so => 314
	i64 u0x6fd2265da78b93a4, ; 516: lib_Microsoft.Maui.dll.so => 208
	i64 u0x6fdfc7de82c33008, ; 517: cs/Microsoft.Maui.Controls.resources => 351
	i64 u0x6ffc4967cc47ba57, ; 518: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 519: System.IO.FileSystem.dll => 51
	i64 u0x70664ad3307f4fbf, ; 520: Xamarin.Grpc.Core.dll => 334
	i64 u0x70e99f48c05cb921, ; 521: tr/Microsoft.Maui.Controls.resources.dll => 377
	i64 u0x70fb7a3521043a40, ; 522: Plugin.CloudFirestore => 212
	i64 u0x70fd3deda22442d2, ; 523: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 367
	i64 u0x71485e7ffdb4b958, ; 524: System.Reflection.Extensions => 94
	i64 u0x7162a2fce67a945f, ; 525: lib_Xamarin.Android.Glide.Annotations.dll.so => 226
	i64 u0x71a495ea3761dde8, ; 526: lib-it-Microsoft.Maui.Controls.resources.dll.so => 363
	i64 u0x71ad672adbe48f35, ; 527: System.ComponentModel.Primitives.dll => 16
	i64 u0x720f102581a4a5c8, ; 528: Xamarin.AndroidX.Core.ViewTree => 249
	i64 u0x725f5a9e82a45c81, ; 529: System.Security.Cryptography.Encoding => 123
	i64 u0x72b1fb4109e08d7b, ; 530: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 360
	i64 u0x72e0300099accce1, ; 531: System.Xml.XPath.XDocument => 160
	i64 u0x730bfb248998f67a, ; 532: System.IO.Compression.ZipFile => 45
	i64 u0x732b2d67b9e5c47b, ; 533: Xamarin.Google.ErrorProne.Annotations.dll => 320
	i64 u0x734b76fdc0dc05bb, ; 534: lib_GoogleGson.dll.so => 189
	i64 u0x73a6be34e822f9d1, ; 535: lib_System.Runtime.Serialization.dll.so => 116
	i64 u0x73e4ce94e2eb6ffc, ; 536: lib_System.Memory.dll.so => 63
	i64 u0x74327ad47b9741a4, ; 537: Xamarin.AndroidX.NavigationEvent.Android.dll => 285
	i64 u0x743a1eccf080489a, ; 538: WindowsBase.dll => 166
	i64 u0x74fcb5b9d3ee6884, ; 539: Plugin.LocalNotification => 213
	i64 u0x755a91767330b3d4, ; 540: lib_Microsoft.Extensions.Configuration.dll.so => 197
	i64 u0x75c326eb821b85c4, ; 541: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 542: lib_Xamarin.AndroidX.SavedState.dll.so => 290
	i64 u0x76ca07b878f44da0, ; 543: System.Runtime.Numerics.dll => 111
	i64 u0x7736c8a96e51a061, ; 544: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 233
	i64 u0x7752fb9ea97b4e3a, ; 545: Firebase.Storage.dll => 177
	i64 u0x778a805e625329ef, ; 546: System.Linq.Parallel => 60
	i64 u0x77d48bf846bc0f10, ; 547: Xamarin.Io.OpenCensus.OpenCensusContribGrpcMetrics => 339
	i64 u0x77f8a4acc2fdc449, ; 548: System.Security.Cryptography.Cng.dll => 121
	i64 u0x780bc73597a503a9, ; 549: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 366
	i64 u0x782c5d8eb99ff201, ; 550: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 551: th/Microsoft.Maui.Controls.resources.dll => 376
	i64 u0x784b4ff3eed363ff, ; 552: Xamarin.Firebase.Common => 308
	i64 u0x78a45e51311409b6, ; 553: Xamarin.AndroidX.Fragment.dll => 259
	i64 u0x78ed4ab8f9d800a1, ; 554: Xamarin.AndroidX.Lifecycle.ViewModel => 273
	i64 u0x7939c1796e1e9b03, ; 555: Square.OkHttp.dll => 219
	i64 u0x7a090e7cbb6c0ed1, ; 556: Xamarin.GooglePlayServices.Location => 328
	i64 u0x7a5207a7c82d30b4, ; 557: lib_Xamarin.JSpecify.dll.so => 341
	i64 u0x7a7e7eddf79c5d26, ; 558: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 273
	i64 u0x7a9a57d43b0845fa, ; 559: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 560: Xamarin.AndroidX.Collection.dll => 240
	i64 u0x7adb8da2ac89b647, ; 561: fi/Microsoft.Maui.Controls.resources.dll => 356
	i64 u0x7b13d9eaa944ade8, ; 562: Xamarin.AndroidX.DynamicAnimation.dll => 255
	i64 u0x7bef86a4335c4870, ; 563: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 564: sk/Microsoft.Maui.Controls.resources.dll => 374
	i64 u0x7c2a0bd1e0f988fc, ; 565: lib-de-Microsoft.Maui.Controls.resources.dll.so => 353
	i64 u0x7c41d387501568ba, ; 566: System.Net.WebClient.dll => 77
	i64 u0x7c482cd79bd24b13, ; 567: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 244
	i64 u0x7cb95ad2a929d044, ; 568: Xamarin.GooglePlayServices.Basement => 326
	i64 u0x7cd2ec8eaf5241cd, ; 569: System.Security.dll => 131
	i64 u0x7cf9ae50dd350622, ; 570: Xamarin.Jetbrains.Annotations.dll => 340
	i64 u0x7d649b75d580bb42, ; 571: ms/Microsoft.Maui.Controls.resources.dll => 366
	i64 u0x7d8ee2bdc8e3aad1, ; 572: System.Numerics.Vectors => 83
	i64 u0x7df5df8db8eaa6ac, ; 573: Microsoft.Extensions.Logging.Debug => 203
	i64 u0x7dfc3d6d9d8d7b70, ; 574: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 575: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 576: lib_System.Security.Claims.dll.so => 119
	i64 u0x7e4465b3f78ad8d0, ; 577: Xamarin.KotlinX.Serialization.Core.dll => 346
	i64 u0x7e571cad5915e6c3, ; 578: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 268
	i64 u0x7e65340ed0da76d2, ; 579: Xamarin.Grpc.OkHttp => 335
	i64 u0x7e6b1ca712437d7d, ; 580: Xamarin.AndroidX.Emoji2.ViewsHelper => 257
	i64 u0x7e946809d6008ef2, ; 581: lib_System.ObjectModel.dll.so => 85
	i64 u0x7ea0272c1b4a9635, ; 582: lib_Xamarin.Android.Glide.dll.so => 225
	i64 u0x7eb4f0dc47488736, ; 583: lib_Xamarin.GooglePlayServices.Tasks.dll.so => 330
	i64 u0x7ecc13347c8fd849, ; 584: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 585: Xamarin.AndroidX.ViewPager.dll => 302
	i64 u0x7f9351cd44b1273f, ; 586: Microsoft.Extensions.Configuration.Abstractions => 198
	i64 u0x7fbd557c99b3ce6f, ; 587: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 266
	i64 u0x8076a9a44a2ca331, ; 588: System.Net.Quic => 72
	i64 u0x80b7e726b0280681, ; 589: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 384
	i64 u0x80da183a87731838, ; 590: System.Reflection.Metadata => 95
	i64 u0x812c069d5cdecc17, ; 591: System.dll => 165
	i64 u0x81381be520a60adb, ; 592: Xamarin.AndroidX.Interpolator.dll => 261
	i64 u0x8145faf772692484, ; 593: Google.Cloud.Firestore.V1.dll => 185
	i64 u0x81657cec2b31e8aa, ; 594: System.Net => 82
	i64 u0x81ab745f6c0f5ce6, ; 595: zh-Hant/Microsoft.Maui.Controls.resources => 382
	i64 u0x8277f2be6b5ce05f, ; 596: Xamarin.AndroidX.AppCompat => 234
	i64 u0x828f06563b30bc50, ; 597: lib_Xamarin.AndroidX.CardView.dll.so => 239
	i64 u0x82b399cb01b531c4, ; 598: lib_System.Web.dll.so => 154
	i64 u0x82df8f5532a10c59, ; 599: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 600: lib_System.Transactions.dll.so => 151
	i64 u0x82f6403342e12049, ; 601: uk/Microsoft.Maui.Controls.resources => 378
	i64 u0x83c14ba66c8e2b8c, ; 602: zh-Hans/Microsoft.Maui.Controls.resources => 381
	i64 u0x846ce984efea52c7, ; 603: System.Threading.Tasks.Parallel.dll => 144
	i64 u0x84ae73148a4557d2, ; 604: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 605: System.Runtime.Serialization.Json.dll => 113
	i64 u0x84f9060cc4a93c8f, ; 606: lib_SkiaSharp.dll.so => 215
	i64 u0x850c5ba0b57ce8e7, ; 607: lib_Xamarin.AndroidX.Collection.dll.so => 240
	i64 u0x851d02edd334b044, ; 608: Xamarin.AndroidX.VectorDrawable => 299
	i64 u0x85410a0ce2b82e74, ; 609: lib_Xamarin.Grpc.Context.dll.so => 333
	i64 u0x85c919db62150978, ; 610: Xamarin.AndroidX.Transition.dll => 298
	i64 u0x8662aaeb94fef37f, ; 611: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x866c029b39d9cde6, ; 612: Plugin.CloudFirestore.dll => 212
	i64 u0x86a909228dc7657b, ; 613: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 382
	i64 u0x86b3e00c36b84509, ; 614: Microsoft.Extensions.Configuration.dll => 197
	i64 u0x86b62cb077ec4fd7, ; 615: System.Runtime.Serialization.Xml => 115
	i64 u0x8706ffb12bf3f53d, ; 616: Xamarin.AndroidX.Annotation.Experimental => 232
	i64 u0x872a5b14c18d328c, ; 617: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 618: Xamarin.Android.Glide.Annotations.dll => 226
	i64 u0x8794c7c19600413d, ; 619: Xamarin.Grpc.Protobuf.Lite => 336
	i64 u0x87b7bede2c8fef74, ; 620: Xamarin.Firebase.ProtoliteWellKnownTypes.dll => 316
	i64 u0x87c69b87d9283884, ; 621: lib_System.Threading.Thread.dll.so => 146
	i64 u0x87f6569b25707834, ; 622: System.IO.Compression.Brotli.dll => 43
	i64 u0x87fef727071b7fe5, ; 623: Grpc.Net.Client => 192
	i64 u0x8842b3a5d2d3fb36, ; 624: Microsoft.Maui.Essentials => 209
	i64 u0x88926583efe7ee86, ; 625: Xamarin.AndroidX.Activity.Ktx.dll => 230
	i64 u0x88b16a1a7051ebe2, ; 626: Xamarin.Firebase.Annotations.dll => 306
	i64 u0x88ba6bc4f7762b03, ; 627: lib_System.Reflection.dll.so => 98
	i64 u0x88bda98e0cffb7a9, ; 628: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 345
	i64 u0x8930322c7bd8f768, ; 629: netstandard => 168
	i64 u0x897a606c9e39c75f, ; 630: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x898a5c6bc9e47ec1, ; 631: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 291
	i64 u0x89911a22005b92b7, ; 632: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 633: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 107
	i64 u0x8a19e3dc71b34b2c, ; 634: System.Reflection.TypeExtensions.dll => 97
	i64 u0x8a90bab2026e5b88, ; 635: Google.Cloud.Firestore.dll => 184
	i64 u0x8ad229ea26432ee2, ; 636: Xamarin.AndroidX.Loader => 278
	i64 u0x8b4ff5d0fdd5faa1, ; 637: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 638: System.Security.Principal.Windows => 128
	i64 u0x8b8d01333a96d0b5, ; 639: System.Diagnostics.Process.dll => 29
	i64 u0x8b9ceca7acae3451, ; 640: lib-he-Microsoft.Maui.Controls.resources.dll.so => 358
	i64 u0x8c230514448fef34, ; 641: Xamarin.Firebase.ProtoliteWellKnownTypes => 316
	i64 u0x8cdfdb4ce85fb925, ; 642: lib_System.Security.Principal.Windows.dll.so => 128
	i64 u0x8cdfe7b8f4caa426, ; 643: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 644: Xamarin.AndroidX.CursorAdapter.dll => 250
	i64 u0x8d52f7ea2796c531, ; 645: Xamarin.AndroidX.Emoji2.dll => 256
	i64 u0x8d7b8ab4b3310ead, ; 646: System.Threading => 149
	i64 u0x8da188285aadfe8e, ; 647: System.Collections.Concurrent => 8
	i64 u0x8dfc1cfbf8858f95, ; 648: Grpc.Core.Api.dll => 191
	i64 u0x8e68459d22cb214f, ; 649: Square.OkHttp => 219
	i64 u0x8e8f269ad1e1ff94, ; 650: lib_Xamarin.AndroidX.Tracing.Tracing.Android.dll.so => 297
	i64 u0x8ec6e06a61c1baeb, ; 651: lib_Newtonsoft.Json.dll.so => 211
	i64 u0x8ed807bfe9858dfc, ; 652: Xamarin.AndroidX.Navigation.Common => 280
	i64 u0x8ee08b8194a30f48, ; 653: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 359
	i64 u0x8ef7601039857a44, ; 654: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 372
	i64 u0x8efbc0801a122264, ; 655: Xamarin.GooglePlayServices.Tasks.dll => 330
	i64 u0x8f32c6f611f6ffab, ; 656: pt/Microsoft.Maui.Controls.resources.dll => 371
	i64 u0x8f44b45eb046bbd1, ; 657: System.ServiceModel.Web.dll => 132
	i64 u0x8f8829d21c8985a4, ; 658: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 370
	i64 u0x8fbf5b0114c6dcef, ; 659: System.Globalization.dll => 42
	i64 u0x8fcc8c2a81f3d9e7, ; 660: Xamarin.KotlinX.Serialization.Core => 346
	i64 u0x8fd42635e63de49e, ; 661: Xamarin.Grpc.Context.dll => 333
	i64 u0x90263f8448b8f572, ; 662: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 663: _Microsoft.Android.Resource.Designer => 387
	i64 u0x90393bd4865292f3, ; 664: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 665: System.Threading.Tasks.Extensions.dll => 143
	i64 u0x90634f86c5ebe2b5, ; 666: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 274
	i64 u0x907b636704ad79ef, ; 667: lib_Microsoft.Maui.Controls.Xaml.dll.so => 207
	i64 u0x90e9efbfd68593e0, ; 668: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 265
	i64 u0x91418dc638b29e68, ; 669: lib_Xamarin.AndroidX.CustomView.dll.so => 251
	i64 u0x9157bd523cd7ed36, ; 670: lib_System.Text.Json.dll.so => 138
	i64 u0x91a74f07b30d37e2, ; 671: System.Linq.dll => 62
	i64 u0x91cb86ea3b17111d, ; 672: System.ServiceModel.Web => 132
	i64 u0x91fa41a87223399f, ; 673: ca/Microsoft.Maui.Controls.resources.dll => 350
	i64 u0x92054e486c0c7ea7, ; 674: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 675: lib_System.Xml.XPath.XDocument.dll.so => 160
	i64 u0x92a698e6d582778f, ; 676: Xamarin.Firebase.Components.dll => 309
	i64 u0x92b138fffca2b01e, ; 677: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 237
	i64 u0x92dfc2bfc6c6a888, ; 678: Xamarin.AndroidX.Lifecycle.LiveData => 265
	i64 u0x933da2c779423d68, ; 679: Xamarin.Android.Glide.Annotations => 226
	i64 u0x9388aad9b7ae40ce, ; 680: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 263
	i64 u0x93a39f9bbc3b3ca4, ; 681: Xamarin.GooglePlayServices.CloudMessaging.dll => 327
	i64 u0x93cfa73ab28d6e35, ; 682: ms/Microsoft.Maui.Controls.resources => 366
	i64 u0x941c00d21e5c0679, ; 683: lib_Xamarin.AndroidX.Transition.dll.so => 298
	i64 u0x944077d8ca3c6580, ; 684: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 685: System.Xml => 164
	i64 u0x94c8990839c4bdb1, ; 686: lib_Xamarin.AndroidX.Interpolator.dll.so => 261
	i64 u0x967fc325e09bfa8c, ; 687: es/Microsoft.Maui.Controls.resources => 355
	i64 u0x9686161486d34b81, ; 688: lib_Xamarin.AndroidX.ExifInterface.dll.so => 258
	i64 u0x9729c8c4c069c478, ; 689: Google.Apis.Core => 183
	i64 u0x9732d8dbddea3d9a, ; 690: id/Microsoft.Maui.Controls.resources => 362
	i64 u0x978be80e5210d31b, ; 691: Microsoft.Maui.Graphics.dll => 210
	i64 u0x979ab54025cc1c7f, ; 692: lib_Xamarin.GooglePlayServices.Base.dll.so => 325
	i64 u0x97a7d96b96967bc2, ; 693: lib_Firebase.Auth.dll.so => 175
	i64 u0x97b8c771ea3e4220, ; 694: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 695: System.Collections.Concurrent.dll => 8
	i64 u0x97e55f96df4ddd72, ; 696: lib_Xamarin.Firebase.Annotations.dll.so => 306
	i64 u0x984184e3c70d4419, ; 697: GoogleGson => 189
	i64 u0x9843944103683dd3, ; 698: Xamarin.AndroidX.Core.Core.Ktx => 248
	i64 u0x98b05cc81e6f333c, ; 699: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 291
	i64 u0x98d720cc4597562c, ; 700: System.Security.Cryptography.OpenSsl => 124
	i64 u0x991d510397f92d9d, ; 701: System.Linq.Expressions => 59
	i64 u0x996ceeb8a3da3d67, ; 702: System.Threading.Overlapped.dll => 141
	i64 u0x999cb19e1a04ffd3, ; 703: CommunityToolkit.Mvvm.dll => 174
	i64 u0x99a00ca5270c6878, ; 704: Xamarin.AndroidX.Navigation.Runtime => 282
	i64 u0x99cdc6d1f2d3a72f, ; 705: ko/Microsoft.Maui.Controls.resources.dll => 365
	i64 u0x9a01b1da98b6ee10, ; 706: Xamarin.AndroidX.Lifecycle.Runtime.dll => 269
	i64 u0x9a2d4c8408e9f4b6, ; 707: lib_Plugin.CloudFirestore.dll.so => 212
	i64 u0x9a5ccc274fd6e6ee, ; 708: Jsr305Binding.dll => 318
	i64 u0x9ae6940b11c02876, ; 709: lib_Xamarin.AndroidX.Window.dll.so => 304
	i64 u0x9b211a749105beac, ; 710: System.Transactions.Local => 150
	i64 u0x9b8734714671022d, ; 711: System.Threading.Tasks.Dataflow.dll => 142
	i64 u0x9bc6aea27fbf034f, ; 712: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 344
	i64 u0x9c244ac7cda32d26, ; 713: System.Security.Cryptography.X509Certificates.dll => 126
	i64 u0x9c465f280cf43733, ; 714: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 343
	i64 u0x9c4dd9126a77a711, ; 715: Xamarin.Firebase.Installations.InterOp => 315
	i64 u0x9c8f6872beab6408, ; 716: System.Xml.XPath.XDocument.dll => 160
	i64 u0x9ce01cf91101ae23, ; 717: System.Xml.XmlDocument => 162
	i64 u0x9d128180c81d7ce6, ; 718: Xamarin.AndroidX.CustomView.PoolingContainer => 252
	i64 u0x9d5dbcf5a48583fe, ; 719: lib_Xamarin.AndroidX.Activity.dll.so => 229
	i64 u0x9d74dee1a7725f34, ; 720: Microsoft.Extensions.Configuration.Abstractions.dll => 198
	i64 u0x9e4534b6adaf6e84, ; 721: nl/Microsoft.Maui.Controls.resources => 368
	i64 u0x9e4b95dec42769f7, ; 722: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 723: Xamarin.AndroidX.Navigation.Common.dll => 280
	i64 u0x9ed5eb4af213817e, ; 724: lib_Plugin.Maui.Calendar.dll.so => 214
	i64 u0x9ef542cf1f78c506, ; 725: Xamarin.AndroidX.Lifecycle.LiveData.Core => 266
	i64 u0x9f2c1126c41c6e52, ; 726: lib_Xamarin.Io.OpenCensus.OpenCensusContribGrpcMetrics.dll.so => 339
	i64 u0x9fc2184212c417ad, ; 727: Plugin.LocalNotification.dll => 213
	i64 u0xa00832eb975f56a8, ; 728: lib_System.Net.dll.so => 82
	i64 u0xa088c6d6689b264d, ; 729: Firebase.Auth.dll => 175
	i64 u0xa0ad78236b7b267f, ; 730: Xamarin.AndroidX.Window => 304
	i64 u0xa0d8259f4cc284ec, ; 731: lib_System.Security.Cryptography.dll.so => 127
	i64 u0xa0e17ca50c77a225, ; 732: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 319
	i64 u0xa0ff9b3e34d92f11, ; 733: lib_System.Resources.Writer.dll.so => 101
	i64 u0xa12fbfb4da97d9f3, ; 734: System.Threading.Timer.dll => 148
	i64 u0xa1440773ee9d341e, ; 735: Xamarin.Google.Android.Material => 317
	i64 u0xa1a184e02d8fa4f2, ; 736: Firebase.dll => 176
	i64 u0xa1b9d7c27f47219f, ; 737: Xamarin.AndroidX.Navigation.UI.dll => 283
	i64 u0xa2572680829d2c7c, ; 738: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 739: System.Xml.XmlDocument.dll => 162
	i64 u0xa2beee74530fc01c, ; 740: SkiaSharp.Views.Android => 216
	i64 u0xa308401900e5bed3, ; 741: lib_mscorlib.dll.so => 167
	i64 u0xa395572e7da6c99d, ; 742: lib_System.Security.dll.so => 131
	i64 u0xa3e683f24b43af6f, ; 743: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 744: Xamarin.AndroidX.VectorDrawable.Animated => 300
	i64 u0xa46aa1eaa214539b, ; 745: ko/Microsoft.Maui.Controls.resources => 365
	i64 u0xa4d20d2ff0563d26, ; 746: lib_CommunityToolkit.Mvvm.dll.so => 174
	i64 u0xa4edc8f2ceae241a, ; 747: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 748: System.Runtime.Serialization.Formatters.dll => 112
	i64 u0xa54b74df83dce92b, ; 749: System.Reflection.DispatchProxy => 90
	i64 u0xa579ed010d7e5215, ; 750: Xamarin.AndroidX.DocumentFile => 253
	i64 u0xa5b7152421ed6d98, ; 751: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 752: lib_System.Linq.Parallel.dll.so => 60
	i64 u0xa5ce5c755bde8cb8, ; 753: lib_System.Security.Cryptography.Csp.dll.so => 122
	i64 u0xa5e599d1e0524750, ; 754: System.Numerics.Vectors.dll => 83
	i64 u0xa5f1ba49b85dd355, ; 755: System.Security.Cryptography.dll => 127
	i64 u0xa5f1e826b58a6998, ; 756: System.Linq.Async.dll => 222
	i64 u0xa61975a5a37873ea, ; 757: lib_System.Xml.XmlSerializer.dll.so => 163
	i64 u0xa6593e21584384d2, ; 758: lib_Jsr305Binding.dll.so => 318
	i64 u0xa66cbee0130865f7, ; 759: lib_WindowsBase.dll.so => 166
	i64 u0xa67dbee13e1df9ca, ; 760: Xamarin.AndroidX.SavedState.dll => 290
	i64 u0xa684b098dd27b296, ; 761: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 292
	i64 u0xa68a420042bb9b1f, ; 762: Xamarin.AndroidX.DrawerLayout.dll => 254
	i64 u0xa6d26156d1cacc7c, ; 763: Xamarin.Android.Glide.dll => 225
	i64 u0xa75386b5cb9595aa, ; 764: Xamarin.AndroidX.Lifecycle.Runtime.Android => 270
	i64 u0xa763fbb98df8d9fb, ; 765: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 766: Xamarin.AndroidX.Lifecycle.Common.Jvm => 264
	i64 u0xa7c31b56b4dc7b33, ; 767: hu/Microsoft.Maui.Controls.resources => 361
	i64 u0xa7eab29ed44b4e7a, ; 768: Mono.Android.Export => 170
	i64 u0xa8195217cbf017b7, ; 769: Microsoft.VisualBasic.Core => 2
	i64 u0xa843f6095f0d247d, ; 770: Xamarin.GooglePlayServices.Base.dll => 325
	i64 u0xa859a95830f367ff, ; 771: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 275
	i64 u0xa8b52f21e0dbe690, ; 772: System.Runtime.Serialization.dll => 116
	i64 u0xa8c84ce526c2b4bd, ; 773: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 386
	i64 u0xa8ee4ed7de2efaee, ; 774: Xamarin.AndroidX.Annotation.dll => 231
	i64 u0xa952cc4a0d808a59, ; 775: lib_Google.Api.CommonProtos.dll.so => 178
	i64 u0xa95590e7c57438a4, ; 776: System.Configuration => 19
	i64 u0xaa2219c8e3449ff5, ; 777: Microsoft.Extensions.Logging.Abstractions => 202
	i64 u0xaa443ac34067eeef, ; 778: System.Private.Xml.dll => 89
	i64 u0xaa52de307ef5d1dd, ; 779: System.Net.Http => 65
	i64 u0xaa9a7b0214a5cc5c, ; 780: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 781: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 200
	i64 u0xaaf84bb3f052a265, ; 782: el/Microsoft.Maui.Controls.resources => 354
	i64 u0xab375658f5084c9f, ; 783: lib_Google.Cloud.Firestore.dll.so => 184
	i64 u0xab9af77b5b67a0b8, ; 784: Xamarin.AndroidX.ConstraintLayout.Core => 245
	i64 u0xab9c1b2687d86b0b, ; 785: lib_System.Linq.Expressions.dll.so => 59
	i64 u0xac2af3fa195a15ce, ; 786: System.Runtime.Numerics => 111
	i64 u0xac5376a2a538dc10, ; 787: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 266
	i64 u0xac5acae88f60357e, ; 788: System.Diagnostics.Tools.dll => 32
	i64 u0xac65e40f62b6b90e, ; 789: Google.Protobuf => 188
	i64 u0xac79c7e46047ad98, ; 790: System.Security.Principal.Windows.dll => 128
	i64 u0xac98d31068e24591, ; 791: System.Xml.XDocument => 159
	i64 u0xacd46e002c3ccb97, ; 792: ro/Microsoft.Maui.Controls.resources => 372
	i64 u0xacda2fab67639416, ; 793: Xamarin.Firebase.Installations => 314
	i64 u0xacdd9e4180d56dda, ; 794: Xamarin.AndroidX.Concurrent.Futures => 243
	i64 u0xacf42eea7ef9cd12, ; 795: System.Threading.Channels => 140
	i64 u0xad7e82ed3b0f16d0, ; 796: lib_Xamarin.AndroidX.DocumentFile.dll.so => 253
	i64 u0xad89c07347f1bad6, ; 797: nl/Microsoft.Maui.Controls.resources.dll => 368
	i64 u0xadbb53caf78a79d2, ; 798: System.Web.HttpUtility => 153
	i64 u0xadc90ab061a9e6e4, ; 799: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 800: Xamarin.AndroidX.Collection.Ktx => 242
	i64 u0xadd8eda2edf396ad, ; 801: Xamarin.Android.Glide.GifDecoder => 228
	i64 u0xadf4cf30debbeb9a, ; 802: System.Net.ServicePoint.dll => 75
	i64 u0xadf511667bef3595, ; 803: System.Net.Security => 74
	i64 u0xae0aaa94fdcfce0f, ; 804: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 805: Java.Interop => 169
	i64 u0xae53579c90db1107, ; 806: System.ObjectModel.dll => 85
	i64 u0xaf732d0b2193b8f5, ; 807: System.Security.Cryptography.OpenSsl.dll => 124
	i64 u0xafdb94dbccd9d11c, ; 808: Xamarin.AndroidX.Lifecycle.LiveData.dll => 265
	i64 u0xafe29f45095518e7, ; 809: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 276
	i64 u0xb03ae931fb25607e, ; 810: Xamarin.AndroidX.ConstraintLayout => 244
	i64 u0xb05cc42cd94c6d9d, ; 811: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 375
	i64 u0xb0ac21bec8f428c5, ; 812: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 272
	i64 u0xb0bb43dc52ea59f9, ; 813: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 814: System.Security.AccessControl => 118
	i64 u0xb220631954820169, ; 815: System.Text.RegularExpressions => 139
	i64 u0xb2376e1dbf8b4ed7, ; 816: System.Security.Cryptography.Csp => 122
	i64 u0xb2a1959fe95c5402, ; 817: lib_System.Runtime.InteropServices.JavaScript.dll.so => 106
	i64 u0xb2a3f67f3bf29fce, ; 818: da/Microsoft.Maui.Controls.resources => 352
	i64 u0xb3011a0a57f7ffb2, ; 819: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 384
	i64 u0xb34f09b530d826d6, ; 820: Xamarin.AndroidX.NavigationEvent.dll => 284
	i64 u0xb363b43eeec5798e, ; 821: lib_Xamarin.Firebase.Iid.Interop.dll.so => 313
	i64 u0xb3874072ee0ecf8c, ; 822: Xamarin.AndroidX.VectorDrawable.Animated.dll => 300
	i64 u0xb39eed1decc0cd95, ; 823: Google.Api.Gax.dll => 179
	i64 u0xb3f0a0fcda8d3ebc, ; 824: Xamarin.AndroidX.CardView => 239
	i64 u0xb404462cdf3bffdb, ; 825: lib_Xamarin.Firebase.ProtoliteWellKnownTypes.dll.so => 316
	i64 u0xb4512edf6d2b372b, ; 826: Google.Cloud.Location => 186
	i64 u0xb46be1aa6d4fff93, ; 827: hi/Microsoft.Maui.Controls.resources => 359
	i64 u0xb477491be13109d8, ; 828: ar/Microsoft.Maui.Controls.resources => 349
	i64 u0xb4bd7015ecee9d86, ; 829: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 830: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 831: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb5c38bf497a4cfe2, ; 832: lib_System.Threading.Tasks.dll.so => 145
	i64 u0xb5c7fcdafbc67ee4, ; 833: Microsoft.Extensions.Logging.Abstractions.dll => 202
	i64 u0xb5ea31d5244c6626, ; 834: System.Threading.ThreadPool.dll => 147
	i64 u0xb7212c4683a94afe, ; 835: System.Drawing.Primitives => 35
	i64 u0xb7b7753d1f319409, ; 836: sv/Microsoft.Maui.Controls.resources => 375
	i64 u0xb81a2c6e0aee50fe, ; 837: lib_System.Private.CoreLib.dll.so => 173
	i64 u0xb898d1802c1a108c, ; 838: lib_System.Management.dll.so => 223
	i64 u0xb8b0a9b3dfbc5cb7, ; 839: Xamarin.AndroidX.Window.Extensions.Core.Core => 305
	i64 u0xb8c60af47c08d4da, ; 840: System.Net.ServicePoint => 75
	i64 u0xb8e68d20aad91196, ; 841: lib_System.Xml.XPath.dll.so => 161
	i64 u0xb90ff82c284e9af9, ; 842: Grpc.Core.Api => 191
	i64 u0xb9185c33a1643eed, ; 843: Microsoft.CSharp.dll => 1
	i64 u0xb960d6b2200ba320, ; 844: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll => 277
	i64 u0xb9b8001adf4ed7cc, ; 845: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 293
	i64 u0xb9f64d3b230def68, ; 846: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 371
	i64 u0xb9fc3c8a556e3691, ; 847: ja/Microsoft.Maui.Controls.resources => 364
	i64 u0xba4670aa94a2b3c6, ; 848: lib_System.Xml.XDocument.dll.so => 159
	i64 u0xba48785529705af9, ; 849: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 850: lib_System.Windows.dll.so => 155
	i64 u0xbb286883bc35db36, ; 851: System.Transactions.dll => 151
	i64 u0xbb6026d73f757bcf, ; 852: Google.Api.Gax.Grpc => 180
	i64 u0xbb65706fde942ce3, ; 853: System.Net.Sockets => 76
	i64 u0xbba28979413cad9e, ; 854: lib_System.Runtime.CompilerServices.VisualC.dll.so => 103
	i64 u0xbbd180354b67271a, ; 855: System.Runtime.Serialization.Formatters => 112
	i64 u0xbc0e640e7c6bcdf8, ; 856: Xamarin.Grpc.Api => 332
	i64 u0xbc260cdba33291a3, ; 857: Xamarin.AndroidX.Arch.Core.Common.dll => 236
	i64 u0xbd0e2c0d55246576, ; 858: System.Net.Http.dll => 65
	i64 u0xbd3fbd85b9e1cb29, ; 859: lib_System.Net.HttpListener.dll.so => 66
	i64 u0xbd437a2cdb333d0d, ; 860: Xamarin.AndroidX.ViewPager2 => 303
	i64 u0xbd4f572d2bd0a789, ; 861: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd5d0b88d3d647a5, ; 862: lib_Xamarin.AndroidX.Browser.dll.so => 238
	i64 u0xbd854cde2dba71a3, ; 863: lib_Square.OkHttp.dll.so => 219
	i64 u0xbd877b14d0b56392, ; 864: System.Runtime.Intrinsics.dll => 109
	i64 u0xbd960c672af2c51e, ; 865: Xamarin.GooglePlayServices.Stats => 329
	i64 u0xbe65a49036345cf4, ; 866: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 867: Xamarin.AndroidX.AppCompat.AppCompatResources => 235
	i64 u0xbef9919db45b4ca7, ; 868: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 869: lib_Xamarin.AndroidX.Annotation.dll.so => 231
	i64 u0xbfc1e1fb3095f2b3, ; 870: lib_System.Net.Http.Json.dll.so => 64
	i64 u0xc040a4ab55817f58, ; 871: ar/Microsoft.Maui.Controls.resources.dll => 349
	i64 u0xc07cadab29efeba0, ; 872: Xamarin.AndroidX.Core.Core.Ktx.dll => 248
	i64 u0xc0d928351ab5ca77, ; 873: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 874: System.Runtime.Intrinsics => 109
	i64 u0xc111030af54d7191, ; 875: System.Resources.Writer => 101
	i64 u0xc12b8b3afa48329c, ; 876: lib_System.Linq.dll.so => 62
	i64 u0xc1649f545b2f76aa, ; 877: Grpc.Auth => 190
	i64 u0xc183ca0b74453aa9, ; 878: lib_System.Threading.Tasks.Dataflow.dll.so => 142
	i64 u0xc1ff9ae3cdb6e1e6, ; 879: Xamarin.AndroidX.Activity.dll => 229
	i64 u0xc226d517e7e30388, ; 880: lib_Xamarin.Grpc.Stub.dll.so => 337
	i64 u0xc26c064effb1dea9, ; 881: System.Buffers.dll => 7
	i64 u0xc2850fbba221599d, ; 882: lib_Google.Apis.Core.dll.so => 183
	i64 u0xc28c50f32f81cc73, ; 883: ja/Microsoft.Maui.Controls.resources.dll => 364
	i64 u0xc2902f6cf5452577, ; 884: lib_Mono.Android.Export.dll.so => 170
	i64 u0xc2a3bca55b573141, ; 885: System.IO.FileSystem.Watcher => 50
	i64 u0xc2bcfec99f69365e, ; 886: Xamarin.AndroidX.ViewPager2.dll => 303
	i64 u0xc30b52815b58ac2c, ; 887: lib_System.Runtime.Serialization.Xml.dll.so => 115
	i64 u0xc36d7d89c652f455, ; 888: System.Threading.Overlapped => 141
	i64 u0xc396b285e59e5493, ; 889: GoogleGson.dll => 189
	i64 u0xc3c86c1e5e12f03d, ; 890: WindowsBase => 166
	i64 u0xc421b61fd853169d, ; 891: lib_System.Net.WebSockets.Client.dll.so => 80
	i64 u0xc4628cb75a5204b4, ; 892: lib_Xamarin.GooglePlayServices.CloudMessaging.dll.so => 327
	i64 u0xc463e077917aa21d, ; 893: System.Runtime.Serialization.Json => 113
	i64 u0xc4d3858ed4d08512, ; 894: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 276
	i64 u0xc50fded0ded1418c, ; 895: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 896: lib_System.Net.Requests.dll.so => 73
	i64 u0xc5293b19e4dc230e, ; 897: Xamarin.AndroidX.Navigation.Fragment => 281
	i64 u0xc5325b2fcb37446f, ; 898: lib_System.Private.Xml.dll.so => 89
	i64 u0xc535cb9a21385d9b, ; 899: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 227
	i64 u0xc5a0f4b95a699af7, ; 900: lib_System.Private.Uri.dll.so => 87
	i64 u0xc5cdcd5b6277579e, ; 901: lib_System.Security.Cryptography.Algorithms.dll.so => 120
	i64 u0xc5d608afb58abba2, ; 902: Google.Apis.Auth.dll => 182
	i64 u0xc5ec286825cb0bf4, ; 903: Xamarin.AndroidX.Tracing.Tracing => 296
	i64 u0xc5fe73d2394f68ac, ; 904: Xamarin.Io.OpenCensus.OpenCensusApi.dll => 338
	i64 u0xc62af3e2d6d38289, ; 905: lib_Xamarin.Firebase.Firestore.dll.so => 311
	i64 u0xc6706bc8aa7fe265, ; 906: Xamarin.AndroidX.Annotation.Jvm => 233
	i64 u0xc6c2d0367d74968d, ; 907: Microcharts.Maui => 195
	i64 u0xc6e1dcc756796701, ; 908: MoodJournal => 0
	i64 u0xc7c01e7d7c93a110, ; 909: System.Text.Encoding.Extensions.dll => 135
	i64 u0xc7ce851898a4548e, ; 910: lib_System.Web.HttpUtility.dll.so => 153
	i64 u0xc809d4089d2556b2, ; 911: System.Runtime.InteropServices.JavaScript.dll => 106
	i64 u0xc858a28d9ee5a6c5, ; 912: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 913: System.Reflection.DispatchProxy.dll => 90
	i64 u0xc8b01aafa0eb7f80, ; 914: Xamarin.Firebase.Iid.dll => 312
	i64 u0xc9c62c8f354ac568, ; 915: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xca3a723e7342c5b6, ; 916: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 377
	i64 u0xca5801070d9fccfb, ; 917: System.Text.Encoding => 136
	i64 u0xcab3493c70141c2d, ; 918: pl/Microsoft.Maui.Controls.resources => 369
	i64 u0xcab69b9a31439815, ; 919: lib_Xamarin.Google.ErrorProne.TypeAnnotations.dll.so => 321
	i64 u0xcacfddc9f7c6de76, ; 920: ro/Microsoft.Maui.Controls.resources.dll => 372
	i64 u0xcadbc92899a777f0, ; 921: Xamarin.AndroidX.Startup.StartupRuntime => 294
	i64 u0xcb76efab0f56f81a, ; 922: System.Reactive => 224
	i64 u0xcba1cb79f45292b5, ; 923: Xamarin.Android.Glide.GifDecoder.dll => 228
	i64 u0xcbb5f80c7293e696, ; 924: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 925: lib__Microsoft.Android.Resource.Designer.dll.so => 387
	i64 u0xcc15da1e07bbd994, ; 926: Xamarin.AndroidX.SlidingPaneLayout => 293
	i64 u0xcc182c3afdc374d6, ; 927: Microsoft.Bcl.AsyncInterfaces => 196
	i64 u0xcc2876b32ef2794c, ; 928: lib_System.Text.RegularExpressions.dll.so => 139
	i64 u0xcc5c3bb714c4561e, ; 929: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 345
	i64 u0xcc76886e09b88260, ; 930: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 347
	i64 u0xcc9fa2923aa1c9ef, ; 931: System.Diagnostics.Contracts.dll => 25
	i64 u0xccf25c4b634ccd3a, ; 932: zh-Hans/Microsoft.Maui.Controls.resources.dll => 381
	i64 u0xcd10a42808629144, ; 933: System.Net.Requests => 73
	i64 u0xcdc772bccba7085f, ; 934: MoodJournal.dll => 0
	i64 u0xcdca1b920e9f53ba, ; 935: Xamarin.AndroidX.Interpolator => 261
	i64 u0xcdd0c48b6937b21c, ; 936: Xamarin.AndroidX.SwipeRefreshLayout => 295
	i64 u0xcde1fa22dc303670, ; 937: Microsoft.VisualStudio.DesignTools.XamlTapContract => 386
	i64 u0xcf23d8093f3ceadf, ; 938: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 939: System.Net.Mail.dll => 67
	i64 u0xcf8fc898f98b0d34, ; 940: System.Private.Xml.Linq => 88
	i64 u0xd04b5f59ed596e31, ; 941: System.Reflection.Metadata.dll => 95
	i64 u0xd063299fcfc0c93f, ; 942: lib_System.Runtime.Serialization.Json.dll.so => 113
	i64 u0xd0de8a113e976700, ; 943: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 944: System.Runtime.Extensions => 104
	i64 u0xd1194e1d8a8de83c, ; 945: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 264
	i64 u0xd12beacdfc14f696, ; 946: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 947: System.Net.Quic.dll => 72
	i64 u0xd20588bdafd1c17c, ; 948: Xamarin.Grpc.Stub.dll => 337
	i64 u0xd3144156a3727ebe, ; 949: Xamarin.Google.Guava.ListenableFuture => 324
	i64 u0xd333d0af9e423810, ; 950: System.Runtime.InteropServices => 108
	i64 u0xd33a415cb4278969, ; 951: System.Security.Cryptography.Encoding.dll => 123
	i64 u0xd3426d966bb704f5, ; 952: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 235
	i64 u0xd3651b6fc3125825, ; 953: System.Private.Uri.dll => 87
	i64 u0xd373685349b1fe8b, ; 954: Microsoft.Extensions.Logging.dll => 201
	i64 u0xd3801faafafb7698, ; 955: System.Private.DataContractSerialization.dll => 86
	i64 u0xd3e4c8d6a2d5d470, ; 956: it/Microsoft.Maui.Controls.resources => 363
	i64 u0xd3edcc1f25459a50, ; 957: System.Reflection.Emit => 93
	i64 u0xd4645626dffec99d, ; 958: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 200
	i64 u0xd4fa0abb79079ea9, ; 959: System.Security.Principal.dll => 129
	i64 u0xd5507e11a2b2839f, ; 960: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 276
	i64 u0xd5d04bef8478ea19, ; 961: Xamarin.AndroidX.Tracing.Tracing.dll => 296
	i64 u0xd60815f26a12e140, ; 962: Microsoft.Extensions.Logging.Debug.dll => 203
	i64 u0xd64f50eb4ba264b3, ; 963: lib_Google.LongRunning.dll.so => 187
	i64 u0xd65786d27a4ad960, ; 964: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 383
	i64 u0xd6694f8359737e4e, ; 965: Xamarin.AndroidX.SavedState => 290
	i64 u0xd6949e129339eae5, ; 966: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 248
	i64 u0xd6d21782156bc35b, ; 967: Xamarin.AndroidX.SwipeRefreshLayout.dll => 295
	i64 u0xd6de019f6af72435, ; 968: Xamarin.AndroidX.ConstraintLayout.Core.dll => 245
	i64 u0xd6ed09ee80649430, ; 969: lib_Xamarin.Grpc.Core.dll.so => 334
	i64 u0xd6f697a581fc6fe3, ; 970: Xamarin.Google.ErrorProne.TypeAnnotations.dll => 321
	i64 u0xd6f6d366d4896aef, ; 971: lib_Xamarin.AndroidX.NavigationEvent.Android.dll.so => 285
	i64 u0xd70956d1e6deefb9, ; 972: Jsr305Binding => 318
	i64 u0xd72329819cbbbc44, ; 973: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 198
	i64 u0xd72c760af136e863, ; 974: System.Xml.XmlSerializer.dll => 163
	i64 u0xd753f071e44c2a03, ; 975: lib_System.Security.SecureString.dll.so => 130
	i64 u0xd7b3764ada9d341d, ; 976: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 202
	i64 u0xd7dfd89d34e8dd1d, ; 977: Square.OkIO => 220
	i64 u0xd7f0088bc5ad71f2, ; 978: Xamarin.AndroidX.VersionedParcelable => 301
	i64 u0xd8113d9a7e8ad136, ; 979: System.CodeDom => 221
	i64 u0xd8fb25e28ae30a12, ; 980: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 287
	i64 u0xda1dfa4c534a9251, ; 981: Microsoft.Extensions.DependencyInjection => 199
	i64 u0xdad05a11827959a3, ; 982: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 983: System.IO.FileSystem.Primitives => 49
	i64 u0xdaff1e02a729f3a2, ; 984: Xamarin.Grpc.Android => 331
	i64 u0xdb5383ab5865c007, ; 985: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 379
	i64 u0xdb58816721c02a59, ; 986: lib_System.Reflection.Emit.ILGeneration.dll.so => 91
	i64 u0xdb8f858873e2186b, ; 987: SkiaSharp.Views.Maui.Controls => 217
	i64 u0xdbeda89f832aa805, ; 988: vi/Microsoft.Maui.Controls.resources.dll => 379
	i64 u0xdbf2a779fbc3ac31, ; 989: System.Transactions.Local.dll => 150
	i64 u0xdbf9607a441b4505, ; 990: System.Linq => 62
	i64 u0xdbfc90157a0de9b0, ; 991: lib_System.Text.Encoding.dll.so => 136
	i64 u0xdc75032002d1a212, ; 992: lib_System.Transactions.Local.dll.so => 150
	i64 u0xdca8be7403f92d4f, ; 993: lib_System.Linq.Queryable.dll.so => 61
	i64 u0xdcbd21904ff0f297, ; 994: Google.Apis => 181
	i64 u0xdce2c53525640bf3, ; 995: Microsoft.Extensions.Logging => 201
	i64 u0xdd2b722d78ef5f43, ; 996: System.Runtime.dll => 117
	i64 u0xdd67031857c72f96, ; 997: lib_System.Text.Encodings.Web.dll.so => 137
	i64 u0xdd70765ad6162057, ; 998: Xamarin.JSpecify => 341
	i64 u0xdd92e229ad292030, ; 999: System.Numerics.dll => 84
	i64 u0xdddcdd701e911af1, ; 1000: lib_Xamarin.AndroidX.Legacy.Support.Core.Utils.dll.so => 262
	i64 u0xdde30e6b77aa6f6c, ; 1001: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 381
	i64 u0xde110ae80fa7c2e2, ; 1002: System.Xml.XDocument.dll => 159
	i64 u0xde4726fcdf63a198, ; 1003: Xamarin.AndroidX.Transition => 298
	i64 u0xde572c2b2fb32f93, ; 1004: lib_System.Threading.Tasks.Extensions.dll.so => 143
	i64 u0xde8769ebda7d8647, ; 1005: hr/Microsoft.Maui.Controls.resources.dll => 360
	i64 u0xdee075f3477ef6be, ; 1006: Xamarin.AndroidX.ExifInterface.dll => 258
	i64 u0xdf4b773de8fb1540, ; 1007: System.Net.dll => 82
	i64 u0xdfa254ebb4346068, ; 1008: System.Net.Ping => 70
	i64 u0xe0142572c095a480, ; 1009: Xamarin.AndroidX.AppCompat.dll => 234
	i64 u0xe021eaa401792a05, ; 1010: System.Text.Encoding.dll => 136
	i64 u0xe02f89350ec78051, ; 1011: Xamarin.AndroidX.CoordinatorLayout.dll => 246
	i64 u0xe0496b9d65ef5474, ; 1012: Xamarin.Android.Glide.DiskLruCache.dll => 227
	i64 u0xe10b760bb1462e7a, ; 1013: lib_System.Security.Cryptography.Primitives.dll.so => 125
	i64 u0xe14ff8e84737288a, ; 1014: Xamarin.Firebase.Installations.InterOp.dll => 315
	i64 u0xe1566bbdb759c5af, ; 1015: Microsoft.Maui.Controls.HotReload.Forms.dll => 383
	i64 u0xe192a588d4410686, ; 1016: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 1017: System.Runtime.Loader => 110
	i64 u0xe1a77eb8831f7741, ; 1018: System.Security.SecureString.dll => 130
	i64 u0xe1b52f9f816c70ef, ; 1019: System.Private.Xml.Linq.dll => 88
	i64 u0xe1e199c8ab02e356, ; 1020: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1021: System.Net.Security.dll => 74
	i64 u0xe2252a80fe853de4, ; 1022: lib_System.Security.Principal.dll.so => 129
	i64 u0xe22fa4c9c645db62, ; 1023: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 1024: System.Net.Requests.dll => 73
	i64 u0xe26692647e6bcb62, ; 1025: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 271
	i64 u0xe29b73bc11392966, ; 1026: lib-id-Microsoft.Maui.Controls.resources.dll.so => 362
	i64 u0xe2ad448dee50fbdf, ; 1027: System.Xml.Serialization => 158
	i64 u0xe2d920f978f5d85c, ; 1028: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1029: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 1030: Mono.Android.Export.dll => 170
	i64 u0xe3811d68d4fe8463, ; 1031: pt-BR/Microsoft.Maui.Controls.resources.dll => 370
	i64 u0xe3b7cbae5ad66c75, ; 1032: lib_System.Security.Cryptography.Encoding.dll.so => 123
	i64 u0xe4292b48f3224d5b, ; 1033: lib_Xamarin.AndroidX.Core.ViewTree.dll.so => 249
	i64 u0xe4507486c308efd4, ; 1034: lib_Xamarin.GooglePlayServices.Location.dll.so => 328
	i64 u0xe494f7ced4ecd10a, ; 1035: hu/Microsoft.Maui.Controls.resources.dll => 361
	i64 u0xe49a982a2533a332, ; 1036: lib_Google.Cloud.Location.dll.so => 186
	i64 u0xe4a9b1e40d1e8917, ; 1037: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 356
	i64 u0xe4dd7925d04f7f6b, ; 1038: lib_Xamarin.AndroidX.NavigationEvent.dll.so => 284
	i64 u0xe4f74a0b5bf9703f, ; 1039: System.Runtime.Serialization.Primitives => 114
	i64 u0xe5434e8a119ceb69, ; 1040: lib_Mono.Android.dll.so => 172
	i64 u0xe55703b9ce5c038a, ; 1041: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 1042: Microsoft.VisualBasic => 3
	i64 u0xe62913cc36bc07ec, ; 1043: System.Xml.dll => 164
	i64 u0xe6e77c648688b75b, ; 1044: Google.Api.CommonProtos.dll => 178
	i64 u0xe7b0691bcbb5a85d, ; 1045: System.Linq.Async => 222
	i64 u0xe7bea09c4900a191, ; 1046: Xamarin.AndroidX.VectorDrawable.dll => 299
	i64 u0xe7e03cc18dcdeb49, ; 1047: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 1048: lib_System.Configuration.dll.so => 19
	i64 u0xe7ef84b36819564e, ; 1049: Xamarin.AndroidX.NavigationEvent.Android => 285
	i64 u0xe86b0df4ba9e5db8, ; 1050: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 270
	i64 u0xe896622fe0902957, ; 1051: System.Reflection.Emit.dll => 93
	i64 u0xe89a2a9ef110899b, ; 1052: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 1053: Microsoft.Win32.Registry => 5
	i64 u0xe8efe6c2171f7cd2, ; 1054: Xamarin.Google.Guava.dll => 322
	i64 u0xe93ca41931f1f2d0, ; 1055: Xamarin.Grpc.Api.dll => 332
	i64 u0xe957c3976986ab72, ; 1056: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 305
	i64 u0xe98163eb702ae5c5, ; 1057: Xamarin.AndroidX.Arch.Core.Runtime => 237
	i64 u0xe98b0e4b4d44e931, ; 1058: lib_Grpc.Net.Client.dll.so => 192
	i64 u0xe994f23ba4c143e5, ; 1059: Xamarin.KotlinX.Coroutines.Android => 343
	i64 u0xe9b9c8c0458fd92a, ; 1060: System.Windows => 155
	i64 u0xe9d166d87a7f2bdb, ; 1061: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 294
	i64 u0xea5a4efc2ad81d1b, ; 1062: Xamarin.Google.ErrorProne.Annotations => 320
	i64 u0xeaf8e9970fc2fe69, ; 1063: System.Management => 223
	i64 u0xeb2313fe9d65b785, ; 1064: Xamarin.AndroidX.ConstraintLayout.dll => 244
	i64 u0xeb6e275e78cb8d42, ; 1065: Xamarin.AndroidX.LocalBroadcastManager.dll => 279
	i64 u0xeb710a05c0467d46, ; 1066: Xamarin.GooglePlayServices.CloudMessaging => 327
	i64 u0xeb9973cda26e858f, ; 1067: Xamarin.Firebase.Common.dll => 308
	i64 u0xed19c616b3fcb7eb, ; 1068: Xamarin.AndroidX.VersionedParcelable.dll => 301
	i64 u0xed60c6fa891c051a, ; 1069: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 385
	i64 u0xedc4817167106c23, ; 1070: System.Net.Sockets.dll => 76
	i64 u0xedc632067fb20ff3, ; 1071: System.Memory.dll => 63
	i64 u0xedc8e4ca71a02a8b, ; 1072: Xamarin.AndroidX.Navigation.Runtime.dll => 282
	i64 u0xee81f5b3f1c4f83b, ; 1073: System.Threading.ThreadPool => 147
	i64 u0xeeb7ebb80150501b, ; 1074: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 241
	i64 u0xeefc635595ef57f0, ; 1075: System.Security.Cryptography.Cng => 121
	i64 u0xef03b1b5a04e9709, ; 1076: System.Text.Encoding.CodePages.dll => 134
	i64 u0xef432781d5667f61, ; 1077: Xamarin.AndroidX.Print => 286
	i64 u0xef5bcbe61622ee5f, ; 1078: Xamarin.AndroidX.Tracing.Tracing.Android.dll => 297
	i64 u0xef602c523fe2e87a, ; 1079: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 324
	i64 u0xef72742e1bcca27a, ; 1080: Microsoft.Maui.Essentials.dll => 209
	i64 u0xefd1e0c4e5c9b371, ; 1081: System.Resources.ResourceManager.dll => 100
	i64 u0xefe8f8d5ed3c72ea, ; 1082: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 1083: Xamarin.AndroidX.Activity => 229
	i64 u0xf008bcd238ede2c8, ; 1084: System.CodeDom.dll => 221
	i64 u0xf00c29406ea45e19, ; 1085: es/Microsoft.Maui.Controls.resources.dll => 355
	i64 u0xf09e47b6ae914f6e, ; 1086: System.Net.NameResolution => 68
	i64 u0xf0ac2b489fed2e35, ; 1087: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1088: lib_System.Net.ServicePoint.dll.so => 75
	i64 u0xf0de2537ee19c6ca, ; 1089: lib_System.Net.WebHeaderCollection.dll.so => 78
	i64 u0xf1138779fa181c68, ; 1090: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 269
	i64 u0xf11b621fc87b983f, ; 1091: Microsoft.Maui.Controls.Xaml.dll => 207
	i64 u0xf161f4f3c3b7e62c, ; 1092: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1093: System.ValueTuple => 152
	i64 u0xf1c4b4005493d871, ; 1094: System.Formats.Asn1.dll => 38
	i64 u0xf22514cfad2d598b, ; 1095: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so => 277
	i64 u0xf238bd79489d3a96, ; 1096: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 368
	i64 u0xf2feea356ba760af, ; 1097: Xamarin.AndroidX.Arch.Core.Runtime.dll => 237
	i64 u0xf300e085f8acd238, ; 1098: lib_System.ServiceProcess.dll.so => 133
	i64 u0xf33cd2d62dbe52f9, ; 1099: Xamarin.AndroidX.NavigationEvent => 284
	i64 u0xf34e52b26e7e059d, ; 1100: System.Runtime.CompilerServices.VisualC.dll => 103
	i64 u0xf37221fda4ef8830, ; 1101: lib_Xamarin.Google.Android.Material.dll.so => 317
	i64 u0xf3ad9b8fb3eefd12, ; 1102: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 1103: System => 165
	i64 u0xf408654b2a135055, ; 1104: System.Reflection.Emit.ILGeneration.dll => 91
	i64 u0xf4103170a1de5bd0, ; 1105: System.Linq.Queryable.dll => 61
	i64 u0xf42d20c23173d77c, ; 1106: lib_System.ServiceModel.Web.dll.so => 132
	i64 u0xf4727d423e5d26f3, ; 1107: SkiaSharp => 215
	i64 u0xf483be3bba89b4ff, ; 1108: lib_Xamarin.Grpc.Api.dll.so => 332
	i64 u0xf4c1dd70a5496a17, ; 1109: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 1110: System.ServiceProcess.dll => 133
	i64 u0xf4eeeaa566e9b970, ; 1111: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 252
	i64 u0xf518f63ead11fcd1, ; 1112: System.Threading.Tasks => 145
	i64 u0xf5fc7602fe27b333, ; 1113: System.Net.WebHeaderCollection => 78
	i64 u0xf6077741019d7428, ; 1114: Xamarin.AndroidX.CoordinatorLayout => 246
	i64 u0xf6742cbf457c450b, ; 1115: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 270
	i64 u0xf70c0a7bf8ccf5af, ; 1116: System.Web => 154
	i64 u0xf73b506af603bfe1, ; 1117: lib_Square.OkIO.dll.so => 220
	i64 u0xf77b20923f07c667, ; 1118: de/Microsoft.Maui.Controls.resources.dll => 353
	i64 u0xf7e2cac4c45067b3, ; 1119: lib_System.Numerics.Vectors.dll.so => 83
	i64 u0xf7e74930e0e3d214, ; 1120: zh-HK/Microsoft.Maui.Controls.resources.dll => 380
	i64 u0xf7fa0bf77fe677cc, ; 1121: Newtonsoft.Json.dll => 211
	i64 u0xf84773b5c81e3cef, ; 1122: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 378
	i64 u0xf84bc13af9296b71, ; 1123: Firebase => 176
	i64 u0xf8aac5ea82de1348, ; 1124: System.Linq.Queryable => 61
	i64 u0xf8b77539b362d3ba, ; 1125: lib_System.Reflection.Primitives.dll.so => 96
	i64 u0xf8dacc6dd9573437, ; 1126: Square.OkIO.dll => 220
	i64 u0xf8e045dc345b2ea3, ; 1127: lib_Xamarin.AndroidX.RecyclerView.dll.so => 288
	i64 u0xf915dc29808193a1, ; 1128: System.Web.HttpUtility.dll => 153
	i64 u0xf96c777a2a0686f4, ; 1129: hi/Microsoft.Maui.Controls.resources.dll => 359
	i64 u0xf9be54c8bcf8ff3b, ; 1130: System.Security.AccessControl.dll => 118
	i64 u0xf9eec5bb3a6aedc6, ; 1131: Microsoft.Extensions.Options => 204
	i64 u0xfa0e82300e67f913, ; 1132: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1133: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1134: lib_System.Net.Security.dll.so => 74
	i64 u0xfa5ed7226d978949, ; 1135: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 349
	i64 u0xfa645d91e9fc4cba, ; 1136: System.Threading.Thread => 146
	i64 u0xfa99d44ebf9bea5b, ; 1137: SkiaSharp.Views.Maui.Core => 218
	i64 u0xfad4d2c770e827f9, ; 1138: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 1139: System.Net.Ping.dll => 70
	i64 u0xfb087abe5365e3b7, ; 1140: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb3cb754cb2d9fc0, ; 1141: lib_Plugin.LocalNotification.dll.so => 213
	i64 u0xfb846e949baff5ea, ; 1142: System.Xml.Serialization.dll => 158
	i64 u0xfbad3e4ce4b98145, ; 1143: System.Security.Cryptography.X509Certificates => 126
	i64 u0xfbf0a31c9fc34bc4, ; 1144: lib_System.Net.Http.dll.so => 65
	i64 u0xfc61ddcf78dd1f54, ; 1145: Xamarin.AndroidX.LocalBroadcastManager => 279
	i64 u0xfc6b7527cc280b3f, ; 1146: lib_System.Runtime.Serialization.Formatters.dll.so => 112
	i64 u0xfc719aec26adf9d9, ; 1147: Xamarin.AndroidX.Navigation.Fragment.dll => 281
	i64 u0xfc82690c2fe2735c, ; 1148: Xamarin.AndroidX.Lifecycle.Process.dll => 268
	i64 u0xfc93fc307d279893, ; 1149: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 1150: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd22f00870e40ae0, ; 1151: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 254
	i64 u0xfd3ce7bc9232d417, ; 1152: Xamarin.Firebase.Firestore.dll => 311
	i64 u0xfd49b3c1a76e2748, ; 1153: System.Runtime.InteropServices.RuntimeInformation => 107
	i64 u0xfd536c702f64dc47, ; 1154: System.Text.Encoding.Extensions => 135
	i64 u0xfd583f7657b6a1cb, ; 1155: Xamarin.AndroidX.Fragment => 259
	i64 u0xfd8dd91a2c26bd5d, ; 1156: Xamarin.AndroidX.Lifecycle.Runtime => 269
	i64 u0xfda36abccf05cf5c, ; 1157: System.Net.WebSockets.Client => 80
	i64 u0xfddbe9695626a7f5, ; 1158: Xamarin.AndroidX.Lifecycle.Common => 263
	i64 u0xfeae9952cf03b8cb, ; 1159: tr/Microsoft.Maui.Controls.resources => 377
	i64 u0xfebe1950717515f9, ; 1160: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 267
	i64 u0xff270a55858bac8d, ; 1161: System.Security.Principal => 129
	i64 u0xff9b54613e0d2cc8, ; 1162: System.Net.Http.Json => 64
	i64 u0xffdb7a971be4ec73 ; 1163: System.ValueTuple.dll => 152
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1164 x i32] [
	i32 185, i32 42, i32 344, i32 295, i32 13, i32 192, i32 282, i32 105,
	i32 171, i32 48, i32 234, i32 7, i32 86, i32 373, i32 351, i32 379,
	i32 255, i32 333, i32 71, i32 330, i32 288, i32 12, i32 208, i32 102,
	i32 380, i32 156, i32 19, i32 260, i32 241, i32 161, i32 257, i32 299,
	i32 167, i32 373, i32 10, i32 203, i32 300, i32 96, i32 252, i32 254,
	i32 13, i32 204, i32 10, i32 326, i32 127, i32 309, i32 95, i32 176,
	i32 140, i32 39, i32 374, i32 347, i32 302, i32 221, i32 370, i32 172,
	i32 228, i32 5, i32 209, i32 67, i32 292, i32 130, i32 196, i32 191,
	i32 256, i32 0, i32 68, i32 314, i32 216, i32 242, i32 66, i32 57,
	i32 196, i32 251, i32 52, i32 43, i32 125, i32 67, i32 81, i32 271,
	i32 385, i32 158, i32 92, i32 99, i32 288, i32 177, i32 141, i32 312,
	i32 185, i32 151, i32 238, i32 357, i32 162, i32 169, i32 358, i32 306,
	i32 200, i32 81, i32 385, i32 341, i32 242, i32 4, i32 5, i32 51,
	i32 101, i32 337, i32 56, i32 338, i32 120, i32 98, i32 168, i32 118,
	i32 344, i32 21, i32 361, i32 137, i32 97, i32 347, i32 77, i32 367,
	i32 286, i32 294, i32 119, i32 222, i32 8, i32 165, i32 376, i32 70,
	i32 227, i32 272, i32 289, i32 171, i32 182, i32 145, i32 40, i32 292,
	i32 47, i32 188, i32 30, i32 323, i32 283, i32 365, i32 144, i32 204,
	i32 163, i32 28, i32 84, i32 296, i32 77, i32 43, i32 179, i32 29,
	i32 42, i32 103, i32 117, i32 195, i32 336, i32 232, i32 45, i32 91,
	i32 376, i32 56, i32 214, i32 148, i32 384, i32 326, i32 146, i32 100,
	i32 49, i32 179, i32 20, i32 247, i32 114, i32 310, i32 190, i32 182,
	i32 225, i32 357, i32 319, i32 342, i32 205, i32 311, i32 94, i32 58,
	i32 362, i32 360, i32 81, i32 319, i32 169, i32 26, i32 315, i32 331,
	i32 71, i32 312, i32 287, i32 214, i32 215, i32 258, i32 383, i32 378,
	i32 69, i32 33, i32 356, i32 14, i32 139, i32 38, i32 338, i32 382,
	i32 243, i32 369, i32 134, i32 92, i32 88, i32 149, i32 323, i32 375,
	i32 24, i32 310, i32 138, i32 57, i32 51, i32 354, i32 29, i32 157,
	i32 34, i32 164, i32 310, i32 329, i32 259, i32 52, i32 175, i32 387,
	i32 304, i32 90, i32 321, i32 239, i32 35, i32 217, i32 357, i32 157,
	i32 9, i32 355, i32 186, i32 76, i32 334, i32 55, i32 208, i32 351,
	i32 348, i32 206, i32 13, i32 303, i32 197, i32 236, i32 109, i32 336,
	i32 275, i32 32, i32 309, i32 104, i32 84, i32 92, i32 53, i32 96,
	i32 340, i32 180, i32 58, i32 9, i32 102, i32 251, i32 68, i32 328,
	i32 302, i32 224, i32 350, i32 224, i32 211, i32 125, i32 289, i32 116,
	i32 135, i32 291, i32 126, i32 106, i32 187, i32 342, i32 131, i32 335,
	i32 307, i32 238, i32 324, i32 147, i32 156, i32 260, i32 247, i32 188,
	i32 255, i32 187, i32 289, i32 97, i32 24, i32 293, i32 194, i32 143,
	i32 286, i32 280, i32 218, i32 3, i32 180, i32 167, i32 235, i32 100,
	i32 161, i32 184, i32 99, i32 178, i32 249, i32 25, i32 223, i32 93,
	i32 168, i32 172, i32 230, i32 3, i32 369, i32 297, i32 257, i32 1,
	i32 114, i32 342, i32 260, i32 268, i32 181, i32 33, i32 6, i32 373,
	i32 339, i32 156, i32 193, i32 371, i32 53, i32 262, i32 85, i32 308,
	i32 301, i32 348, i32 283, i32 44, i32 267, i32 104, i32 47, i32 138,
	i32 216, i32 277, i32 64, i32 278, i32 69, i32 80, i32 59, i32 89,
	i32 154, i32 236, i32 133, i32 110, i32 363, i32 278, i32 287, i32 171,
	i32 134, i32 140, i32 40, i32 350, i32 331, i32 206, i32 193, i32 329,
	i32 177, i32 60, i32 174, i32 274, i32 307, i32 79, i32 25, i32 36,
	i32 99, i32 271, i32 71, i32 193, i32 22, i32 247, i32 210, i32 374,
	i32 121, i32 69, i32 107, i32 380, i32 279, i32 119, i32 117, i32 263,
	i32 183, i32 264, i32 11, i32 2, i32 124, i32 218, i32 115, i32 142,
	i32 41, i32 87, i32 323, i32 231, i32 173, i32 27, i32 148, i32 364,
	i32 199, i32 320, i32 230, i32 1, i32 190, i32 232, i32 335, i32 44,
	i32 246, i32 149, i32 262, i32 18, i32 322, i32 86, i32 217, i32 352,
	i32 325, i32 41, i32 267, i32 240, i32 272, i32 94, i32 201, i32 28,
	i32 41, i32 78, i32 256, i32 243, i32 144, i32 108, i32 241, i32 313,
	i32 11, i32 105, i32 137, i32 16, i32 122, i32 66, i32 157, i32 22,
	i32 354, i32 346, i32 102, i32 199, i32 345, i32 313, i32 63, i32 58,
	i32 207, i32 353, i32 110, i32 173, i32 307, i32 322, i32 386, i32 343,
	i32 9, i32 317, i32 120, i32 98, i32 105, i32 275, i32 195, i32 206,
	i32 111, i32 233, i32 49, i32 20, i32 274, i32 250, i32 72, i32 245,
	i32 155, i32 39, i32 352, i32 35, i32 38, i32 358, i32 305, i32 108,
	i32 194, i32 367, i32 21, i32 348, i32 181, i32 340, i32 194, i32 273,
	i32 210, i32 15, i32 205, i32 79, i32 79, i32 250, i32 205, i32 253,
	i32 281, i32 152, i32 21, i32 314, i32 208, i32 351, i32 50, i32 51,
	i32 334, i32 377, i32 212, i32 367, i32 94, i32 226, i32 363, i32 16,
	i32 249, i32 123, i32 360, i32 160, i32 45, i32 320, i32 189, i32 116,
	i32 63, i32 285, i32 166, i32 213, i32 197, i32 14, i32 290, i32 111,
	i32 233, i32 177, i32 60, i32 339, i32 121, i32 366, i32 2, i32 376,
	i32 308, i32 259, i32 273, i32 219, i32 328, i32 341, i32 273, i32 6,
	i32 240, i32 356, i32 255, i32 17, i32 374, i32 353, i32 77, i32 244,
	i32 326, i32 131, i32 340, i32 366, i32 83, i32 203, i32 12, i32 34,
	i32 119, i32 346, i32 268, i32 335, i32 257, i32 85, i32 225, i32 330,
	i32 18, i32 302, i32 198, i32 266, i32 72, i32 384, i32 95, i32 165,
	i32 261, i32 185, i32 82, i32 382, i32 234, i32 239, i32 154, i32 36,
	i32 151, i32 378, i32 381, i32 144, i32 56, i32 113, i32 215, i32 240,
	i32 299, i32 333, i32 298, i32 37, i32 212, i32 382, i32 197, i32 115,
	i32 232, i32 14, i32 226, i32 336, i32 316, i32 146, i32 43, i32 192,
	i32 209, i32 230, i32 306, i32 98, i32 345, i32 168, i32 16, i32 291,
	i32 48, i32 107, i32 97, i32 184, i32 278, i32 27, i32 128, i32 29,
	i32 358, i32 316, i32 128, i32 44, i32 250, i32 256, i32 149, i32 8,
	i32 191, i32 219, i32 297, i32 211, i32 280, i32 359, i32 372, i32 330,
	i32 371, i32 132, i32 370, i32 42, i32 346, i32 333, i32 33, i32 387,
	i32 46, i32 143, i32 274, i32 207, i32 265, i32 251, i32 138, i32 62,
	i32 132, i32 350, i32 48, i32 160, i32 309, i32 237, i32 265, i32 226,
	i32 263, i32 327, i32 366, i32 298, i32 46, i32 164, i32 261, i32 355,
	i32 258, i32 183, i32 362, i32 210, i32 325, i32 175, i32 18, i32 8,
	i32 306, i32 189, i32 248, i32 291, i32 124, i32 59, i32 141, i32 174,
	i32 282, i32 365, i32 269, i32 212, i32 318, i32 304, i32 150, i32 142,
	i32 344, i32 126, i32 343, i32 315, i32 160, i32 162, i32 252, i32 229,
	i32 198, i32 368, i32 26, i32 280, i32 214, i32 266, i32 339, i32 213,
	i32 82, i32 175, i32 304, i32 127, i32 319, i32 101, i32 148, i32 317,
	i32 176, i32 283, i32 54, i32 162, i32 216, i32 167, i32 131, i32 37,
	i32 300, i32 365, i32 174, i32 22, i32 112, i32 90, i32 253, i32 50,
	i32 60, i32 122, i32 83, i32 127, i32 222, i32 163, i32 318, i32 166,
	i32 290, i32 292, i32 254, i32 225, i32 270, i32 4, i32 264, i32 361,
	i32 170, i32 2, i32 325, i32 275, i32 116, i32 386, i32 231, i32 178,
	i32 19, i32 202, i32 89, i32 65, i32 30, i32 200, i32 354, i32 184,
	i32 245, i32 59, i32 111, i32 266, i32 32, i32 188, i32 128, i32 159,
	i32 372, i32 314, i32 243, i32 140, i32 253, i32 368, i32 153, i32 17,
	i32 242, i32 228, i32 75, i32 74, i32 15, i32 169, i32 85, i32 124,
	i32 265, i32 276, i32 244, i32 375, i32 272, i32 34, i32 118, i32 139,
	i32 122, i32 106, i32 352, i32 384, i32 284, i32 313, i32 300, i32 179,
	i32 239, i32 316, i32 186, i32 359, i32 349, i32 54, i32 47, i32 28,
	i32 145, i32 202, i32 147, i32 35, i32 375, i32 173, i32 223, i32 305,
	i32 75, i32 161, i32 191, i32 1, i32 277, i32 293, i32 371, i32 364,
	i32 159, i32 12, i32 155, i32 151, i32 180, i32 76, i32 103, i32 112,
	i32 332, i32 236, i32 65, i32 66, i32 303, i32 45, i32 238, i32 219,
	i32 109, i32 329, i32 7, i32 235, i32 55, i32 231, i32 64, i32 349,
	i32 248, i32 20, i32 109, i32 101, i32 62, i32 190, i32 142, i32 229,
	i32 337, i32 7, i32 183, i32 364, i32 170, i32 50, i32 303, i32 115,
	i32 141, i32 189, i32 166, i32 80, i32 327, i32 113, i32 276, i32 17,
	i32 73, i32 281, i32 89, i32 227, i32 87, i32 120, i32 182, i32 296,
	i32 338, i32 311, i32 233, i32 195, i32 0, i32 135, i32 153, i32 106,
	i32 11, i32 90, i32 312, i32 31, i32 377, i32 136, i32 369, i32 321,
	i32 372, i32 294, i32 224, i32 228, i32 40, i32 387, i32 293, i32 196,
	i32 139, i32 345, i32 347, i32 25, i32 381, i32 73, i32 0, i32 261,
	i32 295, i32 386, i32 27, i32 67, i32 88, i32 95, i32 113, i32 31,
	i32 104, i32 264, i32 37, i32 72, i32 337, i32 324, i32 108, i32 123,
	i32 235, i32 87, i32 201, i32 86, i32 363, i32 93, i32 200, i32 129,
	i32 276, i32 296, i32 203, i32 187, i32 383, i32 290, i32 248, i32 295,
	i32 245, i32 334, i32 321, i32 285, i32 318, i32 198, i32 163, i32 130,
	i32 202, i32 220, i32 301, i32 221, i32 287, i32 199, i32 10, i32 49,
	i32 331, i32 379, i32 91, i32 217, i32 379, i32 150, i32 62, i32 136,
	i32 150, i32 61, i32 181, i32 201, i32 117, i32 137, i32 341, i32 84,
	i32 262, i32 381, i32 159, i32 298, i32 143, i32 360, i32 258, i32 82,
	i32 70, i32 234, i32 136, i32 246, i32 227, i32 125, i32 315, i32 383,
	i32 54, i32 110, i32 130, i32 88, i32 23, i32 74, i32 129, i32 31,
	i32 73, i32 271, i32 362, i32 158, i32 23, i32 4, i32 170, i32 370,
	i32 123, i32 249, i32 328, i32 361, i32 186, i32 356, i32 284, i32 114,
	i32 172, i32 32, i32 3, i32 164, i32 178, i32 222, i32 299, i32 30,
	i32 19, i32 285, i32 270, i32 93, i32 36, i32 5, i32 322, i32 332,
	i32 305, i32 237, i32 192, i32 343, i32 155, i32 294, i32 320, i32 223,
	i32 244, i32 279, i32 327, i32 308, i32 301, i32 385, i32 76, i32 63,
	i32 282, i32 147, i32 241, i32 121, i32 134, i32 286, i32 297, i32 324,
	i32 209, i32 100, i32 39, i32 229, i32 221, i32 355, i32 68, i32 26,
	i32 75, i32 78, i32 269, i32 207, i32 24, i32 152, i32 38, i32 277,
	i32 368, i32 237, i32 133, i32 284, i32 103, i32 317, i32 57, i32 165,
	i32 91, i32 61, i32 132, i32 215, i32 332, i32 46, i32 133, i32 252,
	i32 145, i32 78, i32 246, i32 270, i32 154, i32 220, i32 353, i32 83,
	i32 380, i32 211, i32 378, i32 176, i32 61, i32 96, i32 220, i32 288,
	i32 153, i32 359, i32 118, i32 204, i32 6, i32 15, i32 74, i32 349,
	i32 146, i32 218, i32 52, i32 70, i32 23, i32 213, i32 158, i32 126,
	i32 65, i32 279, i32 112, i32 281, i32 268, i32 55, i32 53, i32 254,
	i32 311, i32 107, i32 135, i32 259, i32 269, i32 80, i32 263, i32 377,
	i32 267, i32 129, i32 64, i32 152
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

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

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
