-- NOXABLOX | Auto Rotation build
-- Dibangun dari source SkyP yang diberikan pengguna; fungsi game yang diperlukan diadaptasi.
-- Dependency eksternal _C tetap dimuat dari URL asal dan perlu diaudit terpisah.

local _a = (getgenv and getgenv()) or _G
for _b, _c in ipairs({"__Alfian", "__GTFarm"}) do
    if _a[_c] and _a[_c].Cleanup then
        pcall(_a[_c].Cleanup)
    end
    _a[_c] = nil
end
local _d = {}
_a.__Alfian = _d

local function _e()
    return _a.__Alfian == _d
end
local _f = game:GetService("Players")
local _g = game:GetService("ReplicatedStorage")
local _h = game:GetService("RunService")
local _i = game:GetService("VirtualUser")
local _j = game:GetService("UserInputService")
local _k = _f.LocalPlayer
local _l = _k:WaitForChild("PlayerGui")
local _m = _g:WaitForChild("Shared")
local _n = _g:WaitForChild("WorldRemotes")
local _o = _n:FindFirstChild("SetTile")
local _p = require(_m.ItemDB)
local _q = require(_m.Inventory)
local _r, _s = pcall(require, _m.Net)
local _t = _l:WaitForChild("GameGui")
local _u, _v = pcall(require, _t:WaitForChild("Particles"))
local _w, _x = pcall(require, _t:WaitForChild("WorldMenu"))
local _y, _z = pcall(require, _m:FindFirstChild("Roles"))
local _A, _B = pcall(require, _m:FindFirstChild("Sfx"))
local _C = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Mizoree-ux/Tes-aja/refs/heads/main/main.lua")))()
local _D = {
    Running = false,
    Mode = "Place + Break",
    PlaceMs = 250,
    BreakMs = 220,
    AfterBreakMs = 300,
    HitsOverride = 0,
    BreakBackground = true,
    MultiTarget = 1,
    SelectedId = nil,
    Offsets = {},
    CalibX = 0,
    CalibY = 0,
    AntiAfk = true,
    MutePunch = true,
    LiteMode = false,
    Role = "none",
    AutoCollect = true,
    CollectAround = false,
    CollectRadius = 3,
    Override = nil,
    Quiet = false,
    Cycles = 0,
    Placed = 0,
    Broken = 0,
    Collected = 0,
    CollectFail = 0,
    LastAction = "-",
}
local _E = {
    Speed = 100,
    InfJump = false,
    Ghost = false,
    UpHeld = false,
    DownHeld = false,
    CustomName = true,
    NameText = "@Noxablox",
}
local _F = {
    Running = false,
    IncludeBg = true,
    UseBlock = true,
    ScaffoldId = nil,
    Collect = true,
    Sweep = "Kiri → Kanan",
    Skip = {},
    TopRow = -1,
    DirRow = nil,
    Dir = nil,
    Broken = 0,
    Remaining = -1,
    Status = "-",
}
local _H = {
    Running = false,
    Roam = true,
    Roaming = false,
    A = nil,
    B = nil,
    Ms = 300,
    Made = 0,
    Planted = 0,
    Fail = {},
    Skip = {},
    Status = "-",
}
local _I = {X0 = 0, X1 = 99, Y0 = 2, Gap = 2, Rows = 10, Stairs = true,}
local _J = {
    Running = false,
    BlockId = nil,
    UseBlock = true,
    Produce = true,
    ThenPabrik = false,
    Placed = 0,
    Phase = "-",
    Status = "-",
    Skip = {},
}
local _K = {
    Running = false,
    SeedId = nil,
    BlockId = nil,
    WholeWorld = false,
    Tiles = {},
    WorldMode = "same", -- same | separate
    FarmWorld = "",
    BreakWorld = "",
    FarmTiles = {},
    FarmAnchorX = -1,
    FarmAnchorY = -1,
    BlockThreshold = 200,
    SeedThreshold = 190,
    BreakX = -1,
    BreakY = -1,
    BreakSec = 60,
    Drop = false,
    Keep = 50,
    DropAt = 200,
    DropWorld = "",
    DropX = -1,
    DropY = -1,
    Harvested = 0,
    Planted = 0,
    Dropped = 0,
    Skip = {},
    Status = "-",
    Traveling = false,
    Home = "",
    Zone = nil,
}
local _L = {
    On = false,
    Who = "Staff (Mod/Dev)",
    StopAll = true,
    Leave = false,
    AutoBack = true,
    BackSec = 60,
    CalmSec = 5,
    Mode = "idle",
    Allow = {},
    Alerted = {},
    Saved = nil,
    Token = 0,
    BackAt = 0,
    CalmAt = nil,
    LeftFg = nil,
    BackText = nil,
    Status = "Mati",
    Detected = 0,
}
local _M = {
    Running = false,
    Harvest = true,
    Plant = true,
    Collect = true,
    UseBlock = false,
    ScaffoldId = nil,
    HarvestMs = 250,
    PlantMs = 250,
    SeedId = nil,
    Skip = {},
    Harvested = 0,
    Planted = 0,
    Status = "-",
}
local _N = {active = false, left = false, right = false, jump = false, down = false}
local _O = {On = false, Texts = {}, IntervalSec = 6, Index = 1, Sent = 0, Last = "-",}
local _P = {
    World = nil,
    Inv = nil,
    SetTile = nil,
    State = nil,
    Punch = nil,
    Particles = {},
    Menu = nil,
    Gems = nil,
    Hud = nil,
    Trees = nil,
    Others = nil,
}
local _Q = {list = nil, update = nil}
local _R = {}
local _S = {}
local _T = {}
local _U = {}
local _V = {}
local _W = {Lang = "id", Saved = "id", Ask = true} do
    (function()
        _W.EN = {
            ["Fitur"] = "Features",
            ["Keamanan"] = "Security",
            ["Setelan"] = "Setup",
            ["Pengaturan"] = "Settings",
            ["Penjaga"] = "Guard",
            ["Statistik"] = "Stats",
            ["Tas"] = "Bag",
            ["Lahan"] = "Land",
            ["Auto Rotasi"] = "Factory",
            ["Koneksi"] = "Connection",
            ["Kontrol"] = "Controls",
            ["Mode & Kecepatan"] = "Mode & Speed",
            ["Kecepatan"] = "Speed",
            ["Karakter"] = "Character",
            ["Opsi"] = "Options",
            ["Pesan"] = "Messages",
            ["Aksi saat terdeteksi"] = "Action when detected",
            ["Waktu"] = "Timing",
            ["Lainnya"] = "Other",
            ["Quest Harian"] = "Daily Quests",
            ["Pohon (siap panen)"] = "Trees (ready to harvest)",
            ["Auto Recycle (buang item)"] = "Auto Recycle (trash items)",
            ["Bentuk lahan"] = "Land shape",
            ["Pilihan"] = "Options",
            ["Posisi & tile break"] = "Break position & tiles",
            ["Koreksi posisi"] = "Position correction",
            ["Yang dikirim"] = "What to send",
            ["Bisa juga lewat tombol START di Grid"] = "Can also use the START button in the Grid",
            ["Ambil drop di tile yang dipilih"] = "Pick up drops on the selected tiles",
            ["Collect di sekitar karakter"] = "Collect around character",
            ["Ambil semua drop dalam radius, kapan saja"] = "Pick up all drops within the radius, anytime",
            ["Radius collect (tile)"] = "Collect radius (tiles)",
            [("Dipakai juga Clear, Farmer, Splice & Pabrik. Terlalu jauh bisa d" .. "itolak server")] = ("Also used by Clear, Farmer, Splice & Factory. Too far may be rej" .. "ected by the server"),
            ["Buka Grid Tile"] = "Open Tile Grid",
            ["Kotak 5x5, tengah = karakter"] = "5x5 grid, center = character",
            ["Status Clear"] = "Clear Status",
            ["Bersihkan dari baris atas ke bawah"] = "Clear from the top row down",
            ["Arah sapu"] = "Sweep direction",
            ["Zig-zag lebih cepat (tidak balik ke kiri)"] = "Zig-zag is faster (no going back left)",
            ["Pakai block pijakan"] = "Use scaffold blocks",
            ["Taruh block untuk lewat jurang / naik ke block melayang"] = "Place blocks to cross gaps / reach floating blocks",
            ["Block pijakan"] = "Scaffold block",
            ["Block yang dipakai untuk pijakan"] = "Block used as scaffold",
            ["Auto collect tiap habis pecah"] = "Auto collect after each break",
            ["Ambil drop di sekitar karakter"] = "Pick up drops around the character",
            ["Reset tile yang dilewati"] = "Reset skipped tiles",
            ["Coba lagi tile yang tadi gagal"] = "Retry tiles that failed",
            ["Status Farmer"] = "Farmer Status",
            ["Jalankan Farmer"] = "Run Farmer",
            ["Panen pohon siap & tanam seed otomatis"] = "Harvest ready trees & plant seeds automatically",
            ["Seed untuk ditanam"] = "Seed to plant",
            ["Hanya seed yang ada di inventori"] = "Only seeds in your inventory",
            ["Refresh daftar seed"] = "Refresh seed list",
            ["Hanya pohon yang sudah siap"] = "Only trees that are ready",
            ["Tanam di atas block yang kosong"] = "Plant on top of empty blocks",
            ["Ambil hasil panen di sekitar karakter"] = "Pick up harvest drops around the character",
            ["Jeda setelah tiap panen"] = "Delay after each harvest",
            ["Jeda setelah tiap tanam seed"] = "Delay after each seed planted",
            ["Taruh block kalau tidak ada jalan (block tetap tertinggal)"] = "Place blocks when there is no path (blocks stay behind)",
            ["Place semua tile dulu, lalu break"] = "Place all tiles first, then break",
            ["Jeda setelah tiap place"] = "Delay after each place",
            ["Jeda tiap pukulan (normal 220). Dipakai juga Clear"] = "Delay per hit (normal 220). Also used by Clear",
            [("Auto Farm: tile dipukul bergantian (seperti 2 jari). Pakai Rayma" .. "n's Fist = 2-3 tile segaris sekali pukul")] = ("Auto Farm: tiles are hit in turns (like 2 fingers). With Rayman'" .. "s Fist = 2-3 tiles in a line per punch"),
            ["Jeda setelah hancur (ms)"] = "Delay after break (ms)",
            ["Tunggu sebelum lanjut ke tile berikutnya"] = "Wait before moving to the next tile",
            ["Mode Lite"] = "Lite Mode",
            ["Matikan particle & suara (HP low-end)"] = "Turn off particles & sounds (low-end phones)",
            ["Mute suara pukulan"] = "Mute punch sounds",
            ["Pukulan per block (cadangan)"] = "Hits per block (fallback)",
            ["Dipakai kalau 'Pukul: TIDAK'. 0 = otomatis"] = "Used when 'Punch: NO'. 0 = automatic",
            ["Pilih Block"] = "Select Block",
            ["Hanya item yang bisa di-place"] = "Only placeable items",
            ["Refresh daftar"] = "Refresh list",
            ["Lompat di udara (bisa kena rollback)"] = "Jump mid-air (may get rolled back)",
            ["Fly + Tembus Block"] = "Fly + Noclip",
            ["Tembus block, pakai tombol ▲/▼ (bisa kena rollback)"] = ("Pass through blocks, use the ▲/▼ buttons (may get rolled bac" .. "k)"),
            ["Bahasa / Language"] = "Language / Bahasa",
            ["Ganti bahasa, lalu execute ulang"] = "Change language, then re-execute",
            ["Status Chat"] = "Chat Status",
            ["Daftar pesan"] = "Message list",
            ["Pisahkan dengan |   contoh: halo|jual dirt"] = "Separate with |   example: hi|selling dirt",
            ["pesan 1|pesan 2|pesan 3"] = "message 1|message 2|message 3",
            ["Interval (detik)"] = "Interval (seconds)",
            ["Jeda antar pesan (min 3 detik)"] = "Delay between messages (min 3 seconds)",
            ["Kirim pesan bergantian sesuai urutan"] = "Send messages in order, one after another",
            ["Kirim 1 pesan sekarang"] = "Send 1 message now",
            ["Tes kirim pesan berikutnya"] = "Test sending the next message",
            ["Isi daftar pesan dulu (tekan Enter setelah mengetik)"] = "Fill in the message list first (press Enter after typing)",
            ["Buka Staff Backpack"] = "Open Staff Backpack",
            ["UI staff bawaan game (dikunci server)"] = "Game's built-in staff UI (locked by server)",
            ["Title yang kamu punya"] = "Titles you own",
            ["Refresh daftar role"] = "Refresh role list",
            ["Pakai Role"] = "Use Role",
            ["Sama seperti menu Title game"] = "Same as the game's Title menu",
            ["Menu game belum ketemu. Tekan 'Hubungkan ke game' dulu"] = "Game menu not found. Press 'Connect to game' first",
            ["Fungsi PickTitle tidak ada"] = "PickTitle function not found",
            ["Status Penjaga"] = "Guard Status",
            ["Mati"] = "Off",
            ["Aktifkan Penjaga"] = "Enable Guard",
            ["Pantau Mod / Dev / pemain yang masuk world"] = "Watch for Mods / Devs / players entering the world",
            ["Yang dideteksi"] = "Detect",
            ["Semua pemain: yang sudah ada saat dinyalakan diabaikan"] = "All players: those already here when enabled are ignored",
            ["Diam semua aktivitas"] = "Pause all activities",
            ["Keluar world"] = "Leave world",
            ["Langsung keluar world saat terdeteksi"] = "Leave the world immediately when detected",
            ["Lanjut otomatis setelah aman"] = "Auto resume when safe",
            ["Keluar world: masuk lagi, cek, lalu lanjut aktivitas sebelumnya"] = "Leave world: rejoin, check, then resume previous activity",
            ["Masuk world lagi setelah (detik)"] = "Rejoin world after (seconds)",
            ["Untuk mode keluar world"] = "For leave-world mode",
            ["Tunggu aman (detik)"] = "Safe wait (seconds)",
            ["Untuk mode diam: jeda setelah mereka pergi"] = "For pause mode: delay after they leave",
            ["Abaikan pemain yang ada sekarang"] = "Ignore players here now",
            ["Untuk teman / akun sendiri (staff tetap dideteksi)"] = "For friends / alt accounts (staff are still detected)",
            ["Batalkan tunggu / lanjut"] = "Cancel wait / resume",
            ["Hentikan proses keluar-masuk & lanjut otomatis"] = "Stop the leave-rejoin process & auto resume",
            ["Dibatalkan"] = "Cancelled",
            ["Klaim hadiah quest yang sudah selesai"] = "Claim rewards for finished quests",
            ["Cek quest sekarang"] = "Check quests now",
            ["Tukar semua code aktif yang belum dipakai"] = "Redeem all active codes not used yet",
            ["Cek code sekarang"] = "Check codes now",
            ["Redeem code manual"] = "Redeem code manually",
            ["Ketik code lalu tekan Enter"] = "Type a code then press Enter",
            ["KODE"] = "CODE",
            ["Info World"] = "World Info",
            ["Tekan Scan sekarang"] = "Press Scan now",
            ["Update otomatis tiap 2 detik"] = "Auto update every 2 seconds",
            ["Scan sekarang"] = "Scan now",
            ["Cari item"] = "Search item",
            ["Saring nama item (kosongkan = semua)"] = "Filter item name (empty = all)",
            ["contoh: seed"] = "example: seed",
            ["Daftar"] = "List",
            ["Sesi ini"] = "This session",
            ["Reset statistik"] = "Reset stats",
            ["Mulai hitung dari nol"] = "Start counting from zero",
            ["Kirim ke Discord sekarang"] = "Send to Discord now",
            ["Perlu webhook di tab Discord"] = "Needs a webhook in the Discord tab",
            ["Aktifkan webhook Discord dulu"] = "Enable the Discord webhook first",
            ["Direset"] = "Reset",
            ["Masuk antrian kirim"] = "Added to send queue",
            ["Item yang dipilih di-recycle otomatis"] = "Selected items are recycled automatically",
            ["Item yang di-recycle"] = "Items to recycle",
            ["Bisa pilih banyak. Tool & lock tidak ditampilkan"] = "Multiple allowed. Tools & locks are not shown",
            ["Recycle kalau jumlah >="] = "Recycle when amount >=",
            ["200 = hanya saat penuh 1 slot"] = "200 = only when a slot is full",
            ["Sisakan"] = "Keep",
            ["Jumlah yang tidak ikut di-recycle"] = "Amount not recycled",
            ["Refresh daftar item"] = "Refresh item list",
            ["100 WL -> 1 DL, 100 DL -> 1 BGL (sama seperti game)"] = "100 WL -> 1 DL, 100 DL -> 1 BGL (same as the game)",
            ["Status Splice"] = "Splice Status",
            ["Tanam Seed A lalu splice Seed B"] = "Plant Seed A then splice Seed B",
            ["Seed A (ditanam)"] = "Seed A (planted)",
            ["Seed B (di-splice)"] = "Seed B (spliced)",
            ["Keliling world (A*)"] = "Roam world (A*)",
            ["Nyala: jalan ke seluruh world. Mati: hanya tile Grid 5x5"] = "On: walk the whole world. Off: only the 5x5 Grid tiles",
            ["Jeda tanam / splice (ms)"] = "Plant / splice delay (ms)",
            ["Status Lahan"] = "Land Status",
            ["Bangun Lahan"] = "Build Land",
            [("Hitung block, produksi kalau kurang, lalu pasang dari baris bawa" .. "h")] = "Count blocks, produce if short, then place from the bottom row",
            ["Block lahan"] = "Land block",
            ["Block padat dari inventori"] = "Solid block from inventory",
            ["X awal"] = "Start X",
            ["Kolom paling kiri"] = "Leftmost column",
            ["X akhir"] = "End X",
            ["Kolom paling kanan (lebih dari lebar world = sampai ujung)"] = "Rightmost column (beyond world width = to the edge)",
            ["Y baris atas"] = "Top row Y",
            ["Baris block paling atas (minimal 1)"] = "Topmost block row (minimum 1)",
            ["Jarak antar baris"] = "Row spacing",
            [("2 = y1, y3, y5.. | 3 = y1, y4, y7.. (maks 3 supaya bisa lompat n" .. "aik)")] = "2 = y1, y3, y5.. | 3 = y1, y4, y7.. (max 3 so you can jump up)",
            ["Jumlah baris"] = "Number of rows",
            ["Tangga di pojok kiri-kanan"] = "Stairs at left-right corners",
            ["Ujung baris dibuka bergantian, jadi bisa turun-naik zig-zag"] = "Row ends open alternately, so you can go up/down in a zig-zag",
            ["Pakai posisi karakter sebagai pojok kiri-atas"] = "Use character position as top-left corner",
            ["X awal = kolom karakter, Y baris atas = tile di bawah kaki"] = "Start X = character column, top row Y = tile under the feet",
            ["Produksi block kalau kurang"] = "Produce blocks if short",
            ["Tanam & panen seed block itu dulu sampai cukup"] = "Plant & harvest that block's seed first until enough",
            ["Boleh taruh block pijakan"] = "Allow scaffold blocks",
            ["Kalau baris paling bawah tidak terjangkau dari tanah"] = "If the bottom row can't be reached from the ground",
            ["Lanjut Auto Rotasi setelah selesai"] = "Start Factory when finished",
            ["Status Auto Rotasi"] = "Factory Status",
            ["Jalankan Auto Rotasi"] = "Run Factory",
            ["Break -> tanam -> panen -> break lagi, seed lebihan di-drop"] = ("Break -> plant -> harvest -> break again, extra seeds are droppe" .. "d"),
            ["Seed rotasi"] = "Factory seed",
            ["Block-nya otomatis (contoh: Dirt Seed -> Dirt)"] = "Block is automatic (example: Dirt Seed -> Dirt)",
            ["Tanam di seluruh world"] = "Plant in the whole world",
            ["Mati = hanya di lahan (tab Lahan)"] = "Off = only on the land (Land tab)",
            ["Pakai posisi sekarang untuk break"] = "Use current position for breaking",
            ["Berdiri di tempat break, lalu tekan"] = "Stand at the break spot, then press",
            ["Pilih tile break (Grid)"] = "Select break tiles (Grid)",
            ["Grid terbuka dalam mode Auto Rotasi (terpisah dari tile Auto Farm)"] = "Grid opens in Factory mode (separate from Auto Farm tiles)",
            ["Lama 1 sesi break (detik)"] = "Break session length (seconds)",
            ["Setelah ini cek pohon siap dulu"] = "After this, check for ready trees first",
            ["Sisakan seed"] = "Seeds to keep",
            ["Untuk ditanam lagi"] = "For replanting",
            ["Drop kalau seed sudah"] = "Drop when seeds reach",
            ["Contoh 200 & sisakan 50 = drop 150"] = "Example 200 & keep 50 = drop 150",
            ["World drop"] = "Drop world",
            ["Kosong = world ini | WORLD | WORLD:ID (masuk lewat pintu ID)"] = "Empty = this world | WORLD | WORLD:ID (enter via door ID)",
            ["Pakai posisi sekarang untuk drop"] = "Use current position for dropping",
            ["Berdiri di tempat drop (boleh di world lain), lalu tekan"] = "Stand at the drop spot (can be another world), then press",
            ["Hapus posisi drop"] = "Clear drop position",
            ["Drop di titik kedatangan (pintu) saja"] = "Drop at the arrival point (door) instead",
            ["Ada block tapi posisi / tile break belum diatur"] = "Has blocks but break position / tiles are not set",
            ["Gagal jalan ke posisi break, dicoba lagi nanti"] = "Failed to walk to break position, retrying later",
            ["Referensi game"] = "Game references",
            ["Hubungkan ke game"] = "Connect to game",
            ["Pakai setelah pindah world"] = "Use after changing worlds",
            ["Simpan pengaturan otomatis, dimuat lagi saat execute"] = "Save settings automatically, loaded again on execute",
            ["Simpan config sekarang"] = "Save config now",
            ["Hapus file config, lalu execute ulang"] = "Delete the config file, then re-execute",
            ["Koreksi posisi X"] = "Position correction X",
            ["Isi 1 / -1 kalau tile meleset"] = "Enter 1 / -1 if tiles are off",
            ["Koreksi posisi Y"] = "Position correction Y",
            ["Masuk lagi & lanjut aktivitas kalau terlempar"] = "Rejoin & resume activity if kicked out",
            ["Terlempar dari world"] = "Kicked from world",
            ["World ditutup / di-kick: masuk lagi ke world yang sama"] = "World closed / kicked: rejoin the same world",
            ["Selalu kembali ke world"] = "Always return to world",
            [("Kalau berada di luar world (layar pilih world), masuk lagi otoma" .. "tis")] = "If outside a world (world select screen), rejoin automatically",
            ["World tujuan"] = "Target world",
            ["Kosongkan = world terakhir yang kamu masuki"] = "Empty = the last world you entered",
            ["NAMAWORLD"] = "WORLDNAME",
            ["Rejoin world sekarang"] = "Rejoin world now",
            ["Keluar lalu masuk lagi, aktivitas dilanjutkan"] = "Leave and rejoin, activity resumes",
            ["Disconnect dari server"] = "Disconnected from server",
            ["Teleport ulang ke game lalu masuk world terakhir"] = "Teleport back to the game and enter the last world",
            ["Jeda sebelum masuk lagi (detik)"] = "Delay before rejoining (seconds)",
            ["URL script (untuk rejoin server)"] = "Script URL (for server rejoin)",
            [("Link raw script ini, supaya jalan lagi setelah teleport. Kosong " .. "= pakai autoexec")] = ("Raw link of this script, so it runs again after teleport. Empty " .. "= use autoexec"),
            ["Sedang proses masuk world, tunggu dulu"] = "Already entering a world, please wait",
            ["World tujuan belum ada. Isi 'World tujuan' atau masuk world dulu"] = ("No target world yet. Fill in 'Target world' or enter a world fir" .. "st"),
            ["Notifikasi Discord"] = "Discord Notifications",
            ["Kirim kabar penting ke channel Discord kamu"] = "Send important updates to your Discord channel",
            ["URL Webhook"] = "Webhook URL",
            ["Channel Discord > Edit > Integrasi > Webhook > Salin URL"] = "Discord channel > Edit > Integrations > Webhook > Copy URL",
            ["Tes kirim"] = "Test send",
            ["Laporan statistik (menit)"] = "Stats report (minutes)",
            ["Kirim statistik sesi tiap X menit. 0 = mati"] = "Send session stats every X minutes. 0 = off",
            ["Mod / Dev / pemain masuk world"] = "Mod / Dev / player entered world",
            ["Aktivitas berhenti (block habis / error)"] = "Activity stopped (out of blocks / error)",
            ["Quest diklaim / redeem berhasil"] = "Quest claimed / redeem successful",
            ["Terlempar / disconnect / masuk lagi"] = "Kicked / disconnected / rejoined",
            ["Auto Rotasi drop seed / lahan selesai / berhenti"] = "Factory dropped seeds / land done / stopped",
            ["Isi URL webhook dulu"] = "Fill in the webhook URL first",
            ["Pesan tes masuk antrian"] = "Test message queued",
            ["URL webhook tidak valid"] = "Invalid webhook URL",
            ["Tes notifikasi dari Noxablox"] = "Test notification from Noxablox",
            ["Kiri → Kanan"] = "Left → Right",
            ["Semua pemain"] = "All players",
            ["Semua"] = "All",
            ["Depan"] = "Front",
            ["Break saja"] = "Break only",
            ["Place saja"] = "Place only",
            ["(memuat...)"] = "(loading...)",
            ["(inventori kosong)"] = "(inventory empty)",
            ["(inventori belum terbaca)"] = "(inventory not read yet)",
            ["(inventori kosong / belum terbaca)"] = "(inventory empty / not read yet)",
            ["Channel chat world belum ada (masuk world dulu)"] = "World chat channel not found (enter a world first)",
            ["Daftar pesan kosong"] = "Message list is empty",
            ["Inventori penuh"] = "Inventory full",
            ["Tanya bahasa saat execute"] = "Ask language on execute",
            ["Execute ulang untuk ganti bahasa / Re-execute to apply"] = "Re-execute to apply the new language",
            ["Munculkan pilihan bahasa tiap execute"] = "Show the language choice on every execute",
            ["Grid Tile"] = "Tile Grid",
            ["Bersihkan pilihan"] = "Clear selection",
            ["Tile Break Pabrik"] = "Factory Break Tiles",
            ["START ROTASI"] = "START FACTORY",
            ["STOP ROTASI"] = "STOP FACTORY",
        }
        _W.PH = {
            {"Data world belum ketemu", "World data not found"},
            {"Data drop belum ketemu", "Drop data not found"},
            {"Data pohon belum ketemu", "Tree data not found"},
            {"Data pohon tidak ketemu", "Tree data not found"},
            {"Tekan 'Hubungkan ke game'", "Press 'Connect to game'"},
            {"Hubungkan ke game", "Connect to game"},
            {"Kamu belum masuk world", "You are not in a world yet"},
            {"belum masuk world", "not in a world yet"},
            {"tidak di world", "not in a world"},
            {"Menunggu karakter / world...", "Waiting for character / world..."},
            {"Menunggu pohon siap", "Waiting for trees to be ready"},
            {"Menunggu", "Waiting"},
            {"Dihentikan karena", "Stopped because"},
            {"Dihentikan", "Stopped"},
            {"dimulai", "started"},
            {"hubungkan ulang ke game", "reconnecting to game"},
            {"Dijeda Penjaga", "Paused by Guard"},
            {"Dijeda", "Paused"},
            {"Waspada", "Alert"},
            {"Ada:", "Present:"},
            {"Aman", "Safe"},
            {"Pemain di world", "Players in world"},
            {"Staff online di server", "Staff online on server"},
            {"Terdeteksi", "Detected"},
            {"kali", "times"},
            {"tidak ada", "none"},
            {"pemain diabaikan", "players ignored"},
            {"Masuk world", "Entered world"},
            {"Keluar world", "Leave world"},
            {"Masuk lagi dalam", "Rejoining in"},
            {"Masuk lagi ke", "Rejoining"},
            {"Masuk lagi berhasil", "Rejoined"},
            {"Masuk lagi", "Rejoin"},
            {"Masuk ke", "Entering"},
            {"Masih ada", "Still here:"},
            {"Keluar lagi", "Leaving again"},
            {"Sudah keluar world", "Already left the world"},
            {"lanjut otomatis mati", "auto resume off"},
            {"Di luar world", "Outside the world"},
            {"Mereka sudah pergi", "They left"},
            {"Lanjut dalam", "Resuming in"},
            {"Sudah aman", "Safe now"},
            {"World aman", "World is safe"},
            {"World sudah beda", "Different world"},
            {"aktivitas tidak dilanjutkan", "activity not resumed"},
            {"aktivitas dilanjutkan", "activity resumed"},
            {"aktivitas hanya dijeda", "activity only paused"},
            {"lanjut aktivitas", "resuming activity"},
            {"Lanjut aktivitas", "Resuming activity"},
            {"Gagal balik ke posisi farm", "Failed to return to farm position"},
            {"Auto Farm tidak dilanjutkan", "Auto Farm not resumed"},
            {"Jalan balik ke posisi farm", "Walking back to farm position"},
            {"Jalan ke posisi break", "Walking to break position"},
            {"Jalan ke posisi drop", "Walking to drop position"},
            {"Cari jalan A* ke", "Finding A* path to"},
            {"Jalan ke", "Walking to"},
            {"Lompati lubang ke", "Jumping gap to"},
            {"Lompat ke", "Jumping to"},
            {"Turun ke", "Dropping down to"},
            {"Naik pakai block ke", "Climbing with block to"},
            {"Taruh block pijakan", "Placing scaffold block"},
            {"di bawahnya berbahaya", "dangerous below"},
            {"di bawahnya jurang", "pit below"},
            {"Lewati pijakan", "Skip foothold"},
            {"Lewati", "Skip"},
            {"Pukul", "Hit"},
            {"Pecah", "Broke"},
            {"Panen", "Harvest"},
            {"Tanam", "Plant"},
            {"Pasang lahan: sisa", "Placing land: remaining"},
            {"Pasang", "Place"},
            {"Produksi block", "Producing blocks"},
            {"total butuh", "total needed"},
            {"Lahan selesai", "Land finished"},
            {"Block cukup", "Enough blocks"},
            {"mulai pasang", "starting to place"},
            {"Block habis, masih kurang", "Out of blocks, still short"},
            {"Seed & block habis", "Seeds & blocks used up"},
            {"tidak ada pohon tumbuh", "no trees growing"},
            {"Butuh", "Need"},
            {"Seed habis", "Out of seeds"},
            {"seed-nya tidak ketemu", "its seed was not found"},
            {"Block kurang", "Blocks short"},
            {
                "Sisa tile belum terjangkau / terhalang, dicoba lagi",
                "Remaining tiles unreachable / blocked, retrying"
            },
            {"Lahan penuh, menunggu", "Land is full, waiting"},
            {"Bukan di world farming", "Not in the factory world"},
            {"menunggu...", "waiting..."},
            {"Pergi ke", "Going to"},
            {"untuk drop", "to drop"},
            {"Pulang ke", "Returning to"},
            {"Gagal pulang ke world farming", "Failed to return to factory world"},
            {"Drop gagal", "Drop failed"},
            {"tidak bisa drop di posisi ini", "can't drop at this position"},
            {"tidak bisa jalan ke posisi drop", "can't walk to the drop position"},
            {"Posisi drop belum diatur", "Drop position not set"},
            {"drop dilewati", "drop skipped"},
            {"Posisi drop dihapus", "Drop position cleared"},
            {"Posisi drop", "Drop position"},
            {"Posisi break", "Break position"},
            {"di posisi break", "at the factory position"},
            {"Auto Rotasi berhenti", "Factory stopped"},
            {"Bangun Lahan", "Build Land"},
            {"Auto Rotasi", "Factory"},
            {"Penjaga", "Guard"},
            {"Lahan", "Land"},
            {"Gagal masuk lagi ke", "Failed to rejoin"},
            {"Gagal masuk", "Failed to enter"},
            {"Gagal keluar world", "Failed to leave world"},
            {"Dicoba lagi nanti", "Will retry later"},
            {"dicoba lagi", "retrying"},
            {"Gagal splice", "Splice failed"},
            {"ditolak server", "rejected by server"},
            {"Splice jadi", "Spliced into"},
            {
                "Menunggu tile Grid kosong (panen dulu pohonnya)",
                "Waiting for empty Grid tiles (harvest the trees first)"
            },
            {"Seed A habis, tidak ada pohon A yang bisa di-splice", "Seed A used up, no A trees to splice"},
            {"tidak ada tempat tanam / pohon untuk di-splice", "no planting spot / tree to splice"},
            {"Karakter tidak ditemukan (keluar world?)", "Character not found (left the world?)"},
            {"di inventori habis", "in inventory is used up"},
            {"Auto Farm berhenti", "Auto Farm stopped"},
            {"Auto Clear berhenti", "Auto Clear stopped"},
            {"Farmer berhenti", "Farmer stopped"},
            {"Inventori penuh", "Inventory full"},
            {"tidak bisa diambil lagi", "can't be picked up anymore"},
            {"Laporan statistik", "Stats report"},
            {"Quest diklaim", "Quest claimed"},
            {"Redeem berhasil", "Redeem successful"},
            {"Redeem gagal", "Redeem failed"},
            {"Terlempar dari world", "Kicked from world"},
            {"Terlempar dari", "Kicked from"},
            {"Kembali otomatis", "Auto return"},
            {"berhasil", "succeeded"},
            {"Rejoin: menunggu masuk", "Rejoin: waiting to enter"},
            {"Rejoin: gagal masuk", "Rejoin: failed to enter"},
            {"Disconnect dari server", "Disconnected from server"},
            {"script tidak di-queue", "script not queued"},
            {"Berhasil masuk lagi", "Rejoined"},
            {"World tujuan", "Target world"},
            {"Mode diganti, nyalakan lagi", "Mode changed, turn it on again"},
            {"World sudah bersih!", "World is clean!"},
            {
                "Block pijakan belum dipilih / habis: jalan tanpa block pijakan",
                "Scaffold block not selected / empty: moving without scaffold"
            },
            {"Auto Harvest tidak bisa cek pohon siap", "Auto Harvest can't check ready trees"},
            {"Aktifkan Auto Harvest atau Auto Plant", "Enable Auto Harvest or Auto Plant"},
            {"Pilih seed dulu untuk Auto Plant", "Select a seed for Auto Plant first"},
            {"Pilih seed rotasi dulu", "Select a factory seed first"},
            {"Block pasangan seed ini tidak ditemukan", "Block for this seed not found"},
            {"Atur lahan dulu", "Set up the land first"},
            {"Pilih block padat untuk lahan", "Select a solid block for the land"},
            {"Pilih Seed A dan Seed B dulu", "Select Seed A and Seed B first"},
            {"Seed A dan Seed B harus beda", "Seed A and Seed B must differ"},
            {"Kombinasi ini tidak bisa di-splice", "This combination can't be spliced"},
            {"Pilih tile dulu di Grid Tile", "Select tiles in the Tile Grid first"},
            {"Pilih block dari inventori", "Select a block from inventory"},
            {"Hentikan Auto Farm / Clear / Farmer dulu", "Stop Auto Farm / Clear / Farmer first"},
            {"atau nyalakan Keliling world", "or turn on Roam world"},
            {
                "Kontrol gerak game (WorldMenu.isDown) tidak ketemu",
                "Game movement control (WorldMenu.isDown) not found"
            },
            {"Fungsi pukul game belum ketemu", "Game punch function not found"},
            {
                ("Seed habis: atur posisi & tile break di tab Auto Rotasi supaya bisa d" .. "apat seed"),
                ("Out of seeds: set break position & tiles in the Factory tab to g" .. "et seeds")
            },
            {"Config dihapus. Execute ulang untuk default", "Config deleted. Re-execute for defaults"},
            {"Config dimuat", "Config loaded"},
            {"Belum ada config", "No config yet"},
            {"Tersimpan", "Saved"},
            {"Executor tidak bisa simpan file", "Executor can't save files"},
            {"Executor tidak bisa hapus file", "Executor can't delete files"},
            {"Executor tidak punya fungsi request", "Executor has no request function"},
            {"Gagal simpan file", "Failed to save file"},
            {"Gagal hapus file", "Failed to delete file"},
            {"Gagal kirim", "Failed to send"},
            {"Terkirim", "Sent"},
            {"Antrian", "Queue"},
            {"Role dikirim", "Role sent"},
            {"Gagal buka", "Failed to open"},
            {"Gagal", "Failed"},
            {"BERHENTI", "STOPPED"},
            {"JALAN", "RUNNING"},
            {"fase", "phase"},
            {"PANEN", "HARVEST"},
            {"TANAM", "PLANT"},
            {"TUNGGU", "WAIT"},
            {"TIDAK terbaca (harvest mati)", "NOT readable (harvest off)"},
            {"terbaca", "readable"},
            {"TIDAK", "NO"},
            {"cadangan", "fallback"},
            {"Inventori", "Inventory"},
            {"Posisi", "Position"},
            {"Karakter", "Character"},
            {"Aksi", "Action"},
            {"Baris", "Row"},
            {"Pohon", "Trees"},
            {"Pijakan", "Scaffold"},
            {"Pemain", "Players"},
            {"belum dipilih", "not selected"},
            {"belum diatur", "not set"},
            {"ditolak", "rejected"},
            {"Bentuk", "Shape"},
            {"baris", "rows"},
            {"jarak", "spacing"},
            {"tangga", "stairs"},
            {"punya", "have"},
            {"butuh", "need"},
            {"kurang", "short"},
            {"cukup", "enough"},
            {"Terpasang", "Placed"},
            {"terhalang block lain", "blocked by other blocks"},
            {"Celah tanam terisi block", "Planting gaps filled with blocks"},
            {"bersihkan dulu", "clear it first"},
            {"Celah tanam: bersih", "Planting gaps: clear"},
            {"Seed block", "Block seed"},
            {"Hasil", "Result"},
            {"panen", "harvest"},
            {"tanam", "plant"},
            {"di-drop", "dropped"},
            {"sisakan", "keep"},
            {"drop saat", "drop at"},
            {"world ini", "this world"},
            {"pintu", "door"},
            {"Lama sesi", "Session time"},
            {"Block pecah", "Blocks broken"},
            {"Block di-place", "Blocks placed"},
            {"Drop diambil", "Drops collected"},
            {"Item terbanyak", "Top items"},
            {"Selesai", "Done"},
            {"diklaim script", "claimed by script"},
            {"Quest baru dalam", "New quests in"},
            {"Quest belum bisa diambil", "Quests not available yet"},
            {"Gagal ambil quest", "Failed to get quests"},
            {"Gagal ambil daftar code", "Failed to get code list"},
            {"Pesan terakhir", "Last message"},
            {"Cek lagi dalam", "Checking again in"},
            {"detik", "seconds"},
            {"Auto klaim mati", "Auto claim off"},
            {"Code aktif", "Active codes"},
            {"sudah ditukar", "redeemed"},
            {"ditukar script", "redeemed by script"},
            {"Auto redeem mati", "Auto redeem off"},
            {"Redeem sedang ditutup", "Redeem is closed"},
            {"Block depan", "Front blocks"},
            {"tumpukan", "piles"},
            {"siap panen", "ready"},
            {"tumbuh", "growing"},
            {"Scan terakhir", "Last scan"},
            {"siap", "ready"},
            {"berikut", "next"},
            {"Tidak ada yang cocok", "No matches"},
            {"Kosong", "Empty"},
            {"Tidak ada pohon", "No trees"},
            {"item lain", "more items"},
            {"jenis lain", "more types"},
            {"pakai Cari item", "use Search item"},
            {"(pohon)", "(tree)"},
            {"Di-recycle", "Recycled"},
            {"Item dipilih", "Items selected"},
            {"Ditanam", "Planted"},
            {"tidak bisa di-splice", "can't be spliced"},
            {"Pilih Seed A dan Seed B", "Select Seed A and Seed B"},
            {"Menghitung...", "Calculating..."},
            {"Mulai...", "Starting..."},
            {"Lanjut aktivitas...", "Resuming activity..."},
            {"data pemain belum ketemu", "player data not found"},
            {"belum ketemu", "not found"},
            {"tidak ketemu", "not found"},
            {"ketemu", "found"},
            {"tekan", "press"},
            {"tidak ada block padat di inventori", "no solid blocks in inventory"},
            {"tidak ada seed di inventori", "no seeds in inventory"},
            {"tidak ada pohon", "no trees"},
            {"tidak ada tempat tanam", "no planting spot"},
            {"Y baris atas", "top row Y"},
            {"baris atas", "top row"},
            {"Y awal", "start Y"},
            {"X awal", "start X"},
            {"jumlah baris", "row count"},
            {"masuk lagi dalam", "rejoining in"},
            {"masuk ke", "entering"},
            {"dalam", "in"},
            {"Executor tidak punya", "Executor has no"},
            {"tidak bisa dijangkau / dipecah", "can't be reached / broken"},
            {"Sisa", "Remaining"},
            {"dilewati, coba ulang", "skipped, retrying"},
            {"Gagal membaca pengaturan", "Failed to read settings"},
            {"balasan kosong", "empty reply"},
            {"fungsi drop game tidak ketemu", "game drop function not found"},
            {"fungsi masuk world tidak ketemu", "game enter-world function not found"},
            {"fungsi splice game tidak ketemu", "game splice function not found"},
            {"gagal masuk", "failed to enter"},
            {"nama world tidak diketahui", "unknown world name"},
            {"tidak bisa ke server", "can't reach the server"},
            {"tunggu", "wait"},
            {"world penuh / dikunci / gagal", "world full / locked / failed"},
            {"aman", "safe"},
            {"Fase", "Phase"},
            {"Mati", "Off"},
            {"mati", "off"},
            {"pohon siap", "trees ready"},
            {"pohon", "trees"},
            {"di-recycle", "recycled"},
            {"di-splice", "spliced"},
            {"di-place", "placed"},
            {"di-queue", "queued"},
            {"habis", "used up"},
            {"dan", "and"},
            {"atau", "or"},
            {"dari", "from"},
            {"untuk", "for"},
            {"sudah", "already"},
            {"belum", "not yet"},
            {"lagi", "again"},
            {"di", "at"},
            {"ke", "to"},
        }
        _W.RAW = {
            {"(%d+)j (%d+)m (%d+)d", "%1h %2m %3s"},
            {"(%d+)m (%d+)d", "%1m %2s"},
            {"(%d+)j (%d+)m", "%1h %2m"},
            {"/jam", "/hour"},
            {"(%d+) dtk", "%1 s"},
        }
        function _W.prep()
            local _X = {}
            for _Y, _Z in ipairs(_W.PH) do
                if _Z[1] ~= _Z[2] then
                    local _ba = _Z[1]:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0")
                    if _Z[1]:match("^%w") then
                        _ba = "%f[%w]" .. _ba
                    end
                    if _Z[1]:match("%w$") then
                        _ba = _ba .. "%f[%W]"
                    end
                    _X[#_X + 1] = {_ba, (_Z[2]:gsub("%%", "%%%%")), #_Z[1]}
                end
            end
            table.sort(_X, function(_bb, _bc)
                return _bb[3] > _bc[3]
            end)
            _W.list = _X
        end
        function _W.T(_bd)
            if _W.Lang ~= "en" or type(_bd) ~= "string" or _bd == "" then
                return _bd
            end
            local _be = _W.EN[_bd]
            if _be then
                return _be
            end
            if not _W.list then
                _W.prep()
            end
            for _bf, _bg in ipairs(_W.list) do
                _bd = _bd:gsub(_bg[1], _bg[2])
            end
            for _bh, _bi in ipairs(_W.RAW) do
                _bd = _bd:gsub(_bi[1], _bi[2])
            end
            return _bd
        end
        function _W.V(_bj)
            if _W.Lang ~= "en" or type(_bj) ~= "string" then
                return _bj
            end
            return _W.EN[_bj] or _bj
        end
        _W.Backs = setmetatable({}, {__mode = "k"})
        local function _bk(_bl, _bm)
            local _bn = {}
            for _bo, _bp in ipairs(_bl) do
                local _bq = _W.V(_bp)
                _bn[_bo] = _bq
                if type(_bq) == "string" then
                    _bm[_bq] = _bp
                end
            end
            return _bn
        end
        function _W.wrap(_br)
            if _W.Lang ~= "en" or type(_br) ~= "table" then
                return _br
            end
            return setmetatable({}, {
                __index = function(_bs, _bt)
                    local _bu = _br[_bt]
                    if type(_bu) ~= "function" then
                        return _bu
                    end
                    return function(_bv, _bw, ...)
                        local _bx
                        if _bt == "Dropdown" and type(_bw) == "table" then
                            _bx = {}
                            if type(_bw.Values) == "table" then
                                _bw.Values = _bk(_bw.Values, _bx)
                            end
                            if type(_bw.Value) == "string" then
                                _bw.Value = _W.V(_bw.Value)
                            elseif type(_bw.Value) == "table" then
                                _bw.Value = _bk(_bw.Value, _bx)
                            end
                            local _by = _bw.Callback
                            if _by then
                                _bw.Callback = function(_bz, ...)
                                    if type(_bz) == "string" then
                                        _bz = _bx[_bz] or _bz
                                    elseif type(_bz) == "table" then
                                        local _bA = {}
                                        for _bB, _bC in ipairs(_bz) do
                                            _bA[_bB] = _bx[_bC] or _bC
                                        end
                                        _bz = _bA
                                    end
                                    return _by(_bz, ...)
                                end
                            end
                        elseif (_bt == "Refresh" or _bt == "Select") and _W.Backs[_br] then
                            local _bD = _W.Backs[_br]
                            if type(_bw) == "table" then
                                _bw = _bk(_bw, _bD)
                            elseif type(_bw) == "string" then
                                _bw = _W.V(_bw)
                            end
                        end
                        if type(_bw) == "table" and _bt ~= "Refresh" and _bt ~= "Select" and _bw[1] == nil then
                            for _bE, _bF in ipairs({"Title", "Desc", "Placeholder", "Content"}) do
                                if type(_bw[_bF]) == "string" then
                                    _bw[_bF] = _W.T(_bw[_bF])
                                end
                            end
                        elseif type(_bw) == "string" and (_bt == "SetDesc" or _bt == "SetTitle") then
                            _bw = _W.T(_bw)
                        end
                        local _bG = _bu(_br, _bw, ...)
                        if _bx and type(_bG) == "table" then
                            _W.Backs[_bG] = _bx
                        end
                        if type(_bG) == "table" and _bG ~= _br then
                            return _W.wrap(_bG)
                        end
                        return _bG
                    end
                end,
            })
        end
    end)()
end

local function _bH(_bI, _bJ, _bK)
    task.defer(function()
        pcall(function()
            _C:Notify({Title = _W.T(_bI), Content = _W.T(_bJ), Duration = _bK or 3, Icon = "info"})
        end)
    end)
end
local _bL = {
    AutoSave = true,
    Paused = false,
    Folder = "Alfian",
    Data = {},
    List = {},
    LastJson = nil,
    Status = "-",
} do
    (function()
        local _bM = game:GetService("HttpService")
        local _bN = type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"
        _bL.CanFile = _bN
        _bL.Path = _bL.Folder .. "/config_" .. tostring(_k.UserId) .. ".json"
        local function _bO()
            if not _bN then
                return nil
            end
            local _bP, _bQ = pcall(isfile, _bL.Path)
            if not _bP or not _bQ then
                return nil
            end
            local _bR, _bS = pcall(readfile, _bL.Path)
            if not _bR or type(_bS) ~= "string" then
                return nil
            end
            local _bT, _bU = pcall(_bM.JSONDecode, _bM, _bS)
            if _bT and type(_bU) == "table" then
                return _bU
            end
            return nil
        end
        local _bV = _bO()
        _bL.Found = _bV ~= nil
        _bL.Data = _bV or {}
        if _bL.Data.AutoSave == false then
            _bL.AutoSave = false
        end
        _bL.Status = _bL.Found and "Config dimuat" or (_bN and "Belum ada config" or "Executor tidak bisa simpan file")
        function _bL.add(_bW, _bX, _bY, _bZ)
            table.insert(_bL.List, {name = _bW, tbl = _bX, keys = _bY})
            local _ca = _bL.Data[_bW]
            if type(_ca) ~= "table" then
                return
            end
            for _cb, _cc in ipairs(_bY) do
                local _cd, _ce = _ca[_cc], _bX[_cc]
                if _cd ~= nil and not (_bZ and _bZ[_cc]) and (_ce == nil or type(_cd) == type(_ce)) then
                    _bX[_cc] = _cd
                end
            end
        end
        function _bL.saved(_cf, _cg)
            local _ch = _bL.Data[_cf]
            return type(_ch) == "table" and _ch[_cg] or nil
        end
        local function _ci()
            local _cj = {AutoSave = _bL.AutoSave, Version = 1}
            for _ck, _cl in ipairs(_bL.List) do
                local _cm = {}
                for _cn, _co in ipairs(_cl.keys) do
                    _cm[_co] = _cl.tbl[_co]
                end
                _cj[_cl.name] = _cm
            end
            return _cj
        end
        function _bL.save(_cp)
            if not _bN then
                _bL.Status = "Executor tidak bisa simpan file"
                return false
            end
            if _bL.Paused and not _cp then
                return false
            end
            local _cq, _cr = pcall(_bM.JSONEncode, _bM, _ci())
            if not _cq then
                _bL.Status = "Gagal membaca pengaturan"
                return false
            end
            if not _cp and _cr == _bL.LastJson then
                return true
            end
            if type(isfolder) == "function" and type(makefolder) == "function" then
                local _cs, _ct = pcall(isfolder, _bL.Folder)
                if _cs and not _ct then
                    pcall(makefolder, _bL.Folder)
                end
            end
            local _cu = pcall(writefile, _bL.Path, _cr)
            if _cu then
                _bL.LastJson = _cr
                _bL.Paused = false
                _bL.Status = "Tersimpan " .. os.date("%H:%M:%S")
            else
                _bL.Status = "Gagal simpan file"
            end
            return _cu
        end
        function _bL.reset()
            _bL.Paused = true
            _bL.LastJson = nil
            if _bN and type(delfile) == "function" then
                local _cv = pcall(delfile, _bL.Path)
                _bL.Status = _cv and "Config dihapus. Execute ulang untuk default" or "Gagal hapus file"
                return _cv
            end
            _bL.Status = "Executor tidak bisa hapus file"
            return false
        end
        function _bL.start()
            if _bL.Found then
                local _cw, _cx = pcall(_bM.JSONEncode, _bM, _ci())
                if _cw then
                    _bL.LastJson = _cx
                end
            end
            task.spawn(function()
                while _e() do
                    task.wait(3)
                    if _bL.AutoSave and _e() then
                        _bL.save(false)
                    end
                end
            end)
        end
    end)()
end
_bL.add("Farm", _D, {
    "Mode",
    "PlaceMs",
    "BreakMs",
    "AfterBreakMs",
    "HitsOverride",
    "SelectedId",
    "Offsets",
    "CalibX",
    "CalibY",
    "AntiAfk",
    "MutePunch",
    "LiteMode",
    "AutoCollect",
    "MultiTarget",
    "CollectAround",
    "CollectRadius",
})
_bL.add("Clear", _F, {"UseBlock", "ScaffoldId", "Collect", "Sweep"})
_bL.add("Farmer", _M, {
    "Harvest",
    "Plant",
    "Collect",
    "UseBlock",
    "ScaffoldId",
    "HarvestMs",
    "PlantMs",
    "SeedId"
})
_D.PlaceMs = math.max(_D.PlaceMs, 140)
_D.BreakMs = math.max(_D.BreakMs, 200)
_M.HarvestMs = math.max(_M.HarvestMs, 140)
_M.PlantMs = math.max(_M.PlantMs, 140)
_bL.add("Misc", _E, {"Speed"})
_bL.add("Chat", _O, {"Texts", "IntervalSec"})
_bL.add("Lahan", _I, {"X0", "X1", "Y0", "Gap", "Rows", "Stairs"})
_bL.add("Bangun", _J, {"BlockId", "UseBlock", "Produce", "ThenPabrik"})
_bL.add("Auto Rotasi", _K, {
    "SeedId",
    "WholeWorld",
    "WorldMode",
    "FarmWorld",
    "BreakWorld",
    "FarmTiles",
    "FarmAnchorX",
    "FarmAnchorY",
    "BlockThreshold",
    "SeedThreshold",
    "Tiles",
    "BreakX",
    "BreakY",
    "BreakSec",
    "Drop",
    "Keep",
    "DropAt",
    "DropWorld",
    "DropX",
    "DropY",
})
_bL.add("Bahasa", _W, {"Saved", "Ask"})
_W.Lang = (_W.Saved == "en") and "en" or "id"
local _cy = {T0 = os.clock(), Gems0 = nil, Items = {}, Base = {}}
local _cz = {
    On = false,
    Url = "",
    Penjaga = true,
    Stop = true,
    Full = true,
    Bonus = true,
    Rejoin = true,
    Pabrik = true,
    ReportMin = 0,
    Queue = {},
    LastFull = {},
    Status = "-",
} do
    (function()
        local _cA = game:GetService("HttpService")
        local function _cB()
            return (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)
        end
        function _cz.valid(_cC)
            _cC = tostring(_cC or "")
            for _cD, _cE in ipairs({"discord.com", "discordapp.com", "ptb.discord.com", "canary.discord.com"}) do
                if string.sub(_cC, 1, #_cE + 22) == "https://" .. _cE .. "/api/webhooks/" then
                    return true
                end
            end
            return false
        end
        function _cz.send(_cF, _cG)
            if not _cz.On or not _cz.valid(_cz.Url) then
                return
            end
            local _cH = _cF == "test" or _cF == "report" or (_cF == "penjaga" and _cz.Penjaga) or (_cF == "stop" and _cz.Stop) or (_cF == "full" and _cz.Full) or (_cF == "bonus" and _cz.Bonus) or (_cF == "rejoin" and _cz.Rejoin) or (_cF == "pabrik" and _cz.Pabrik)
            if not _cH or #_cz.Queue >= 20 then
                return
            end
            table.insert(_cz.Queue, _W.T(tostring(_cG)))
        end
        task.spawn(function()
            while _e() do
                local _cI = table.remove(_cz.Queue, 1)
                if not _cI then
                    task.wait(0.5)
                else
                    local _cJ = _cB()
                    if not _cJ then
                        _cz.Status = "Executor tidak punya fungsi request"
                    else
                        local _cK = _cA:JSONEncode({username = "Noxablox", content = ("**[%s]** %s"):format(_k.Name, _cI),})
                        local _cL, _cM = pcall(_cJ, {
                            Url = _cz.Url,
                            Method = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body = _cK,
                        })
                        local _cN = _cL and type(_cM) == "table" and tonumber(_cM.StatusCode or _cM.Status) or nil
                        if _cL and (_cN == nil or _cN < 300) then
                            _cz.Status = "Terkirim " .. os.date("%H:%M:%S")
                        else
                            _cz.Status = "Gagal kirim (" .. tostring(_cN or _cM) .. ")"
                        end
                    end
                    task.wait(2.5)
                end
            end
        end)
    end)()
end
local _cO = (debug and debug.getconstants) or getconstants

local function _cP(_cQ)
    if not _cO then
        return false
    end
    if islclosure and not islclosure(_cQ) then
        return false
    end
    local _cR, _cS = pcall(_cO, _cQ)
    if not _cR or type(_cS) ~= "table" then
        return false
    end
    local _cT, _cU, _cV = false, false, false
    for _cW, _cX in pairs(_cS) do
        if _cX == "tile" or _cX == "SetTile" then
            _cT = true
        elseif _cX == "placedAt" then
            _cU = true
        elseif _cX == "flips" then
            _cV = true
        end
    end
    return _cT and _cU and _cV
end

local function _cY(_cZ)
    if not _cO then
        return false
    end
    if islclosure and not islclosure(_cZ) then
        return false
    end
    local _da, _db = pcall(_cO, _cZ)
    if not _da or type(_db) ~= "table" then
        return false
    end
    local _dc, _dd = false, false
    for _de, _df in pairs(_db) do
        if _df == "Empty the Vending Machine first!" then
            _dc = true
        elseif _df == "newCrack" or _df == "HarvestProvider" then
            _dd = true
        end
    end
    return _dc and _dd
end

local function _dg(_dh)
    local _di = rawget(_dh, "state")
    if type(_di) ~= "function" then
        return false
    end
    local _dj, _dk = pcall(_di)
    return _dj and type(_dk) == "table" and type(_dk.x) == "number" and type(_dk.y) == "number" and _dk.facing ~= nil and _dk.vx ~= nil
end

local function _dl(_dm)
    if _dm == _cP or _dm == _cY then
        return false
    end
    if isexecutorclosure then
        local _dn, _do = pcall(isexecutorclosure, _dm)
        if _dn and _do then
            return false
        end
    end
    local _dp, _dq = pcall(debug.info, _dm, "s")
    if _dp and type(_dq) == "string" and _dq ~= "" and not string.find(_dq, "GameGui", 1, true) then
        return false
    end
    return true
end

local function _dr()
    _P.World, _P.Inv, _P.SetTile, _P.State, _P.Punch, _P.Menu = nil, nil, nil, nil, nil, nil
    _P.Gems = nil
    _P.Hud = nil
    _P.Others = nil
    _P.Particles = {}
    if not getgc then
        return false, "Executor tidak punya getgc()"
    end
    for _ds, _dt in ipairs(getgc(true)) do
        local _du = type(_dt)
        if _du == "table" then
            if not _P.World then
                local _dv, _dw = pcall(function()
                    return type(rawget(_dt, "fg")) == "table" and type(rawget(_dt, "bg")) == "table" and type(rawget(_dt, "w")) == "number" and type(rawget(_dt, "h")) == "number" and rawget(_dt, "spawn") ~= nil
                end)
                if _dv and _dw then
                    _P.World = _dt
                end
            end
            if not _P.Inv then
                local _dx, _dy = pcall(function()
                    return getmetatable(_dt) == _q and type(rawget(_dt, "slots")) == "table" and rawget(_dt, "capacity") ~= nil
                end)
                if _dx and _dy then
                    _P.Inv = _dt
                end
            end
            if not _P.State then
                local _dz, _dA = pcall(_dg, _dt)
                if _dz and _dA then
                    _P.State = rawget(_dt, "state")
                end
            end
            if not _P.Menu then
                local _dB, _dC = pcall(function()
                    return type(rawget(_dt, "openBackpack")) == "function" and type(rawget(_dt, "ui")) == "table"
                end)
                if _dB and _dC then
                    _P.Menu = _dt
                end
            end
            if not _P.Gems then
                local _dD, _dE = pcall(function()
                    return type(rawget(_dt, "addGems")) == "function"
                end)
                if _dD and _dE then
                    _P.Gems = _dt
                end
            end
            if not _P.Hud then
                local _dF, _dG = pcall(function()
                    return type(rawget(_dt, "punchRange")) == "function" and type(rawget(_dt, "handPower")) == "function"
                end)
                if _dF and _dG then
                    _P.Hud = _dt
                end
            end
            if not _P.Others then
                local _dH, _dI = pcall(function()
                    return type(rawget(_dt, "list")) == "function" and type(rawget(_dt, "where")) == "function" and type(rawget(_dt, "playerAt")) == "function"
                end)
                if _dH and _dI then
                    _P.Others = _dt
                end
            end
            if _u then
                local _dJ, _dK = pcall(function()
                    return getmetatable(_dt) == _v and type(rawget(_dt, "live")) == "table" and type(rawget(_dt, "free")) == "table"
                end)
                if _dJ and _dK then
                    table.insert(_P.Particles, _dt)
                end
            end
        elseif _du == "function" and (not _P.SetTile or not _P.Punch) and _dl(_dt) then
            if not _P.SetTile and _cP(_dt) then
                _P.SetTile = _dt
            elseif not _P.Punch and _cY(_dt) then
                _P.Punch = _dt
            end
        end
        if _P.World and _P.Inv and _P.SetTile and _P.State and _P.Punch and _P.Menu and _P.Gems and _P.Hud and _P.Others then
            break
        end
    end
    return _P.World ~= nil
end

local function _dL()
    return "World: " .. (_P.World and "OK" or "TIDAK") .. " | Inventori: " .. (_P.Inv and "OK" or "TIDAK") .. " | setTile: " .. (_P.SetTile and "OK" or "cadangan") .. " | Posisi: " .. (_P.State and "OK" or "cadangan") .. " | Pukul: " .. (_P.Punch and "OK" or "TIDAK") .. " | Drop: " .. (_Q.list and "OK" or "TIDAK") .. " | Pohon: " .. (_P.Trees and "OK" or "TIDAK") .. " | Pemain: " .. (_P.Others and "OK" or "TIDAK")
end

local function _dM(_dN)
    local _dO = _p[_dN]
    return (_dO and _dO.name) or ("Item #" .. tostring(_dN))
end

local function _dP(_dQ)
    if not _P.Inv then
        return 0
    end
    local _dR, _dS = pcall(function()
        return _P.Inv:count(_dQ)
    end)
    return _dR and _dS or 0
end

local function _dT(_dU)
    local _dV = _p[_dU]
    if not _dV then
        return false
    end
    if _dV.kind == "tool" or _dV.kind == "cloth" or _dV.kind == "clothes" or _dV.kind == "consumable" then
        return false
    end
    if _dV.lock or _dV.area then
        return false
    end
    return true
end

local function _dW()
    local _dX = {}
    if _P.Inv then
        for _dY, _dZ in ipairs(_P.Inv.slots) do
            if _dZ.id and (_dZ.n or 0) > 0 and _dT(_dZ.id) then
                _dX[#_dX + 1] = _dZ.id
            end
        end
    end
    table.sort(_dX)
    return _dX
end

local function _ea(_eb)
    local _ec = {}
    for _ed, _ee in ipairs(_eb or _dW()) do
        _ec[#_ec + 1] = string.format("%s [%d]", _dM(_ee), _ee)
    end
    if #_ec == 0 then
        _ec = {"(inventori kosong / belum terbaca)"}
    end
    return _ec
end
local _ef = nil
local _eg = false
local _eh = nil
local _ei = nil

local function _ej()
    local _ek = {}
    if _P.Inv then
        for _el, _em in ipairs(_P.Inv.slots) do
            local _en = _em.id and _p[_em.id]
            if _en and _en.kind == "seed" and (_em.n or 0) > 0 then
                _ek[#_ek + 1] = _em.id
            end
        end
    end
    table.sort(_ek)
    return _ek
end

local function _eo(_ep, _eq, _er)
    if not _ep or not _er then
        return
    end
    local _es = "[" .. tostring(_er) .. "]"
    for _et, _eu in ipairs(_eq) do
        if string.sub(_eu, -#_es) == _es then
            pcall(function()
                _ep:Select(_eu)
            end)
            return
        end
    end
end

local function _ev(_ew)
    local _ex = _dW()
    local _ey = table.concat(_ex, ",")
    if _ew or _ey ~= _ef then
        _ef = _ey
        local _ez = _ea(_ex)
        pcall(function()
            _S.InvDropdown:Refresh(_ez)
        end)
        _eo(_S.InvDropdown, _ez, _D.SelectedId)
    end
    local _eA = _ej()
    local _eB = table.concat(_eA, ",")
    if _ew or _eB ~= _eh then
        _eh = _eB
        local _eC = {}
        for _eD, _eE in ipairs(_eA) do
            _eC[#_eC + 1] = string.format("%s [%d]", _dM(_eE), _eE)
        end
        if #_eC == 0 then
            _eC = {"(tidak ada seed di inventori)"}
        end
        pcall(function()
            _S.SeedDropdown:Refresh(_eC)
        end)
        _eo(_S.SeedDropdown, _eC, _M.SeedId)
        if _S.PabrikSeedDropdown then
            pcall(function()
                _S.PabrikSeedDropdown:Refresh(_eC)
            end)
            _eo(_S.PabrikSeedDropdown, _eC, _K.SeedId)
        end
    end
    local _eF = {}
    for _eG, _eH in ipairs(_ex) do
        local _eI = _p[_eH]
        if _eI and _eI.solid and _eI.kind ~= "seed" then
            _eF[#_eF + 1] = _eH
        end
    end
    local _eJ = table.concat(_eF, ",")
    if _ew or _eJ ~= _ei then
        _ei = _eJ
        local _eK = {}
        for _eL, _eM in ipairs(_eF) do
            _eK[#_eK + 1] = string.format("%s [%d]", _dM(_eM), _eM)
        end
        if #_eK == 0 then
            _eK = {"(tidak ada block padat di inventori)"}
        end
        pcall(function()
            _S.ClearBlockDropdown:Refresh(_eK)
        end)
        pcall(function()
            _S.FarmerBlockDropdown:Refresh(_eK)
        end)
        _eo(_S.ClearBlockDropdown, _eK, _F.ScaffoldId)
        _eo(_S.FarmerBlockDropdown, _eK, _M.ScaffoldId)
        if _S.BuildBlockDropdown then
            pcall(function()
                _S.BuildBlockDropdown:Refresh(_eK)
            end)
            _eo(_S.BuildBlockDropdown, _eK, _J.BlockId)
        end
    end
    if _S.SpliceRefresh then
        pcall(_S.SpliceRefresh, _ew)
    end
    if _S.TrashRefresh then
        pcall(_S.TrashRefresh, _ew)
    end
end

local function _eN(_eO)
    if _eO then
        task.defer(function()
            if _e() then
                _ev(true)
            end
        end)
        return
    end
    if _eg then
        return
    end
    _eg = true
    task.delay(1, function()
        _eg = false
        if _e() then
            _ev(false)
        end
    end)
end
local _eP

local function _eQ()
    if _eP then
        pcall(function()
            _eP:Disconnect()
        end)
    end
    if _P.Inv and typeof(_P.Inv.changed) == "Instance" then
        _eP = _P.Inv.changed.Event:Connect(function()
            if _e() then
                _eN(false)
            end
        end)
        table.insert(_T, _eP)
    end
end

local function _eR(_eS, _eT, _eU)
    local _eV = _P.World
    if not _eV or _eT < 0 or _eU < 0 or _eT >= _eV.w or _eU >= _eV.h then
        return nil
    end
    local _eW = _eV[_eS]
    local _eX = _eW and _eW[_eU]
    return _eX and (_eX[_eT] or 0) or nil
end

local function _eY()
    local _eZ = _l:FindFirstChild("GameGui")
    local _fa = _eZ and _eZ:FindFirstChild("World") and _eZ.World:FindFirstChild("Camera")
    local _fb = _fa and _fa:FindFirstChild("Tiles")
    local _fc = _fa and _fa:FindFirstChild("PlayerView")
    if not (_fb and _fc) then
        return nil
    end
    local _fd = _fb:FindFirstChildWhichIsA("ImageLabel")
    if not _fd or _fd.AbsoluteSize.X <= 0 then
        return nil
    end
    return {tiles = _fb, pv = _fc, ts = _fd.AbsoluteSize.X}
end

local function _fe()
    if _P.State then
        local _ff, _fg = pcall(_P.State)
        if _ff and type(_fg) == "table" and type(_fg.x) == "number" then
            if _fg.active == false then
                return nil
            end
            return math.floor(_fg.x) + _D.CalibX, math.floor(_fg.y - 0.475) + _D.CalibY
        end
    end
    local _fh = _eY()
    if not _fh then
        return nil
    end
    local _fi = _fh.pv.AbsolutePosition + _fh.pv.AbsoluteSize / 2
    local _fj = _fi - _fh.tiles.AbsolutePosition
    return math.floor(_fj.X / _fh.ts) + _D.CalibX, math.floor(_fj.Y / _fh.ts) + _D.CalibY
end

local function _fk()
    local _fl = _D.Override
    return (_fl and _fl.offsets) or _D.Offsets
end

local function _fm()
    local _fn = _D.Override
    if _fn then
        return _fn.block
    end
    return _D.SelectedId
end

local function _fo()
    local _fp = _D.Override
    return (_fp and _fp.mode) or _D.Mode
end

local function _fq()
    local _fr = {}
    for _fs in pairs(_fk()) do
        local _ft, _fu = string.match(_fs, "^(-?%d+),(-?%d+)$")
        table.insert(_fr, {dx = tonumber(_ft), dy = tonumber(_fu)})
    end
    table.sort(_fr, function(_fv, _fw)
        if _fv.dy ~= _fw.dy then
            return _fv.dy < _fw.dy
        end
        return _fv.dx < _fw.dx
    end)
    return _fr
end

local function _fx(_fy, _fz, _fA, _fB)
    if _P.SetTile then
        local _fC, _fD = pcall(_P.SetTile, _fy, _fz, _fA, _fB, false, false)
        if _fC then
            return true
        end
        warn("[Noxablox] setTile game gagal, pakai remote langsung: " .. tostring(_fD))
    end
    if _r and type(_s) == "table" and type(_s.tile) == "table" then
        local _fE = pcall(_s.tile.send, {layer = (_fy == "bg") and 2 or 1, x = _fz, y = _fA, id = _fB, flip = false,})
        if not _fE then
            return false
        end
    elseif _o then
        _o:FireServer(_fy, _fz, _fA, _fB, false)
    else
        return false
    end
    local _fF = _P.World and _P.World[_fy]
    if _fF and _fF[_fA] then
        _fF[_fA][_fz] = _fB
    end
    return true
end

local function _fG(_fH, _fI)
    if _r and type(_s) == "table" and _s.act then
        pcall(_s.act.send, {x = _fH + 0.5, y = _fI + 0.5})
    end
end

local function _fJ(_fK)
    if _D.HitsOverride > 0 then
        return _D.HitsOverride
    end
    local _fL = _p[_fK]
    if not _fL then
        return 4
    end
    local _fM = (_fL.kind == "seed") and 20 or _fL.hits
    return tonumber(_fM) or 4
end

local function _fN(_fO)
    if _fO == 0 then
        return false
    end
    local _fP = _p[_fO]
    if not _fP then
        return true
    end
    if _fP.lock or _fP.area or _fP.vend or _fP.display then
        return false
    end
    local _fQ = (_fP.kind == "seed") and 20 or _fP.hits
    return _fQ == nil or _fQ > 0
end
local _fR = 0.32

local function _fS(_fT, _fU)
    local _fV = _fm()
    if not _fV then
        return nil
    end
    local _fW = _eR("fg", _fT, _fU)
    if _fW == nil then
        return nil
    end
    local _fX = _eR("bg", _fT, _fU)
    local _fY = _p[_fV]
    local _fZ = (_fY and _fY.background) and "bg" or "fg"
    local _ga = (_fZ == "bg") and _fX or _fW
    if not (_ga == 0 and (_fZ == "bg" or _fW == 0)) then
        return nil
    end
    if _dP(_fV) <= 0 then
        return "habis"
    end
    _fx(_fZ, _fT, _fU, _fV)
    if _P.Inv then
        pcall(function()
            _P.Inv:remove(_fV, 1)
        end)
    end
    local _gb = _fT .. "," .. _fU
    _U[_gb] = nil
    _V[_gb] = os.clock()
    _D.Placed += 1
    _D.LastAction = "Place " .. _dM(_fV) .. " (" .. _fT .. "," .. _fU .. ")"
    return "place"
end

local function _gc(_gd, _ge)
    local _gf = _eR("fg", _gd, _ge)
    if _gf == nil then
        return false
    end
    if _gf ~= 0 then
        return _fN(_gf)
    end
    local _gg = _eR("bg", _gd, _ge)
    return _D.BreakBackground and _gg ~= nil and _gg ~= 0 and _fN(_gg)
end

local function _gh(_gi, _gj, _gk)
    if _gk == nil then
        _gk = _D.BreakBackground
    end
    local _gl = _gi .. "," .. _gj
    local _gm = _eR("fg", _gi, _gj)
    if _gm == nil then
        return nil
    end
    local _gn = _eR("bg", _gi, _gj)
    local _go, _gp
    if _gm ~= 0 then
        _go, _gp = "fg", _gm
    elseif _gk and _gn ~= 0 then
        _go, _gp = "bg", _gn
    end
    if not _go or not _fN(_gp) then
        return nil
    end
    local _gq = _V[_gl]
    if _gq then
        local _gr = os.clock() - _gq
        if _gr < _fR then
            task.wait(_fR - _gr)
        end
        _V[_gl] = nil
    end
    if _P.Punch then
        local _gs, _gt = pcall(_P.Punch, _gi, _gj, _D.MutePunch or nil, nil)
        if not _gs then
            _D.LastAction = "Error pukul: " .. tostring(_gt)
            return nil
        end
        if _eR(_go, _gi, _gj) ~= _gp then
            _D.Broken += 1
            _D.LastAction = "Break " .. _dM(_gp) .. " (" .. _gi .. "," .. _gj .. ")"
            return "broke"
        end
        _D.LastAction = "Pukul " .. _dM(_gp) .. " (" .. _gi .. "," .. _gj .. ")"
        return "hit"
    end
    local _gu = _U[_gl]
    if not _gu or _gu.id ~= _gp or _gu.layer ~= _go then
        _gu = {id = _gp, layer = _go, n = 0}
        _U[_gl] = _gu
    end
    _gu.n += 1
    _fG(_gi, _gj)
    local _gv = _fJ(_gp)
    if _gu.n >= _gv then
        _fx(_go, _gi, _gj, 0)
        _U[_gl] = nil
        _D.Broken += 1
        _D.LastAction = "Break " .. _dM(_gp) .. " (" .. _gi .. "," .. _gj .. ")"
        return "broke"
    end
    _D.LastAction = "Pukul " .. _dM(_gp) .. " " .. _gu.n .. "/" .. _gv
    return "hit"
end
local _gw = _n:FindFirstChild("TakeDrop")

local function _gx(_gy)
    if debug and debug.getupvalues then
        local _gz, _gA = pcall(debug.getupvalues, _gy)
        if _gz and type(_gA) == "table" then
            return _gA
        end
    end
    local _gB = {}
    local _gC = (debug and debug.getupvalue) or getupvalue
    if _gC then
        for _gD = 1, 60 do
            local _gE, _gF = pcall(_gC, _gy, _gD)
            if not _gE then
                break
            end
            _gB[_gD] = _gF
        end
    end
    return _gB
end

local function _gG(_gH)
    if type(_gH) ~= "table" or _gH == _P.World then
        return false
    end
    local _gI = rawget(_gH, 1)
    if _gI == nil then
        return next(_gH) == nil
    end
    return type(_gI) == "table" and rawget(_gI, "uid") ~= nil and rawget(_gI, "frame") ~= nil
end

local function _gJ()
    _Q.list, _Q.update = nil, nil
    local _gK = _P.World and rawget(_P.World, "dropTaken")
    if type(_gK) == "function" then
        for _gL, _gM in pairs(_gx(_gK)) do
            if not _Q.list and _gG(_gM) then
                _Q.list = _gM
            elseif not _Q.update and type(_gM) == "function" then
                _Q.update = _gM
            end
        end
    end
    local _gN = _n:FindFirstChild("DropTaken")
    if not _Q.list and _gN and getconnections then
        local _gO, _gP = pcall(getconnections, _gN.OnClientEvent)
        if _gO and type(_gP) == "table" then
            for _gQ, _gR in ipairs(_gP) do
                local _gS, _gT = pcall(function()
                    return _gR.Function
                end)
                if _gS and type(_gT) == "function" then
                    for _gU, _gV in pairs(_gx(_gT)) do
                        if not _Q.list and _gG(_gV) then
                            _Q.list = _gV
                        elseif not _Q.update and type(_gV) == "function" then
                            _Q.update = _gV
                        end
                    end
                end
                if _Q.list then
                    break
                end
            end
        end
    end
    if not _Q.list and getgc then
        for _gW, _gX in ipairs(getgc(true)) do
            if type(_gX) == "table" then
                local _gY = rawget(_gX, 1)
                if type(_gY) == "table" and rawget(_gY, "uid") ~= nil and rawget(_gY, "frame") ~= nil and rawget(_gY, "born") ~= nil then
                    _Q.list = _gX
                    break
                end
            end
        end
    end
    return _Q.list ~= nil
end

local function _gZ(_ha)
    local _hb = _P.World and rawget(_P.World, "takeDrop")
    if type(_hb) ~= "function" and not _gw then
        return false
    end
    if _ha.taking or _ha.pending or _ha.display or (_ha.n or 0) <= 0 then
        return false
    end
    if _ha.armed == false and _ha.id ~= 112 then
        return false
    end
    local _hc = os.clock()
    if _R[_ha.uid] and _hc < _R[_ha.uid] then
        return false
    end
    local _hd = _ha.n
    if _ha.id ~= 112 and _P.Inv then
        local _he, _hf = pcall(function()
            return _P.Inv:room(_ha.id)
        end)
        if _he and type(_hf) == "number" then
            _hd = math.min(_hd, _hf)
        end
    end
    if _hd <= 0 then
        _R[_ha.uid] = _hc + 1
        local _hg = _cz.LastFull[_ha.id]
        if not _hg or _hc - _hg > 120 then
            _cz.LastFull[_ha.id] = _hc
            _cz.send("full", "Inventori penuh: " .. _dM(_ha.id) .. " tidak bisa diambil lagi")
        end
        return false
    end
    _ha.taking = true
    _ha.flown = true
    if typeof(_ha.frame) == "Instance" then
        pcall(function()
            _ha.frame.Visible = false
        end)
    end
    local _hh, _hi
    if type(_hb) == "function" then
        _hh, _hi = pcall(_hb, _ha.uid, _hd)
    else
        _hh, _hi = pcall(_gw.InvokeServer, _gw, _ha.uid, _hd)
    end
    _ha.taking = false
    if not (_hh and type(_hi) == "number" and _hi > 0) then
        _D.CollectFail += 1
        _ha.refused = os.clock()
        _R[_ha.uid] = os.clock() + 1
        _ha.flown = nil
        if typeof(_ha.frame) == "Instance" then
            pcall(function()
                _ha.frame.Visible = not _ha.culled
            end)
        end
        return false
    end
    _R[_ha.uid] = nil
    if _ha.id == 112 then
        if _P.Gems then
            pcall(_P.Gems.addGems, _hi)
        end
    elseif _P.Inv then
        pcall(function()
            _P.Inv:add(_ha.id, _hi)
        end)
    end
    if _Q.list and _Q.update and table.find(_Q.list, _ha) then
        pcall(_Q.update, _ha, _ha.n - _hi)
    end
    _D.Collected += _hi
    _cy.Items[_ha.id] = (_cy.Items[_ha.id] or 0) + _hi
    _D.LastAction = "Collect " .. _dM(_ha.id) .. " x" .. _hi
    return true
end

local function _hj(_hk, _hl, _hm)
    return _hl >= _hk.x - 0.15 and _hl < _hk.x + 1.15 and _hm >= _hk.y - 0.15 and _hm < _hk.y + 1.15
end
local _hn = {}
local _ho = 0

local function _hp(_hq, _hr)
    if type(_hq) ~= "table" or _hq.taking or (_hq.n or 0) <= 0 or type(_hq.x) ~= "number" then
        return false
    end
    if _hq.armed == false and _hq.id ~= 112 then
        return false
    end
    local _hs = _R[_hq.uid]
    return not (_hs and _hr < _hs)
end

local function _ht()
    local _hu = _fk()
    local _hv = (_D.AutoCollect or _D.Override ~= nil) and next(_hu) ~= nil
    local _hw = _D.CollectAround or (_F.Running and _F.Collect) or (_M.Running and _M.Collect) or _K.Running or _J.Running or _H.Roaming
    if not _hv and not _hw then
        return
    end
    local _hx = _Q.list
    if not _hx then
        local _hy = os.clock()
        if _hy >= _ho then
            _ho = _hy + 5
            _gJ()
        end
        return
    end
    if #_hx == 0 then
        return
    end
    local _hz, _hA = false, nil
    if _P.State then
        _hz, _hA = pcall(_P.State)
    end
    if not (_hz and type(_hA) == "table" and type(_hA.x) == "number") then
        return
    end
    local _hB, _hC = _hA.x, _hA.y - 0.475
    local _hD, _hE = _fe()
    local _hF = os.clock()
    local _hG = (_D.CollectRadius or 3) + 0.2
    local _hH = _K.Zone
    if _hH and _hH.world ~= (_P.World and rawget(_P.World, "name")) then
        _hH = nil
    end
    for _hI = #_hx, 1, -1 do
        local _hJ = _hx[_hI]
        if _hp(_hJ, _hF) and not (_hH and math.abs(_hJ.x - _hH.x) <= 2.5 and math.abs(_hJ.y - _hH.y) <= 2.5) then
            local _hK = _hw and math.abs(_hJ.x - _hB) <= _hG and math.abs(_hJ.y - _hC) <= _hG
            if not _hK and _hv and _hD then
                for _hL in pairs(_hu) do
                    local _hM = _hn[_hL]
                    if not _hM then
                        local _hN, _hO = string.match(_hL, "^(-?%d+),(-?%d+)$")
                        _hM = {tonumber(_hN), tonumber(_hO)}
                        _hn[_hL] = _hM
                    end
                    if _hj({x = _hD + _hM[1], y = _hE + _hM[2]}, _hJ.x, _hJ.y) then
                        _hK = true
                        break
                    end
                end
            end
            if _hK then
                task.spawn(_gZ, _hJ)
            end
        end
    end
end
table.insert(_T, _h.Heartbeat:Connect(function()
    if _e() then
        _ht()
    end
end))

local function _hP(_hQ, _hR)
    local _hS = _Q.list
    if not _hS then
        return
    end
    local _hT = os.clock()
    while os.clock() - _hT < _hR and _e() do
        local _hU, _hV = os.clock(), false
        for _hW, _hX in ipairs(_hS) do
            if type(_hX) == "table" and type(_hX.x) == "number" and (_hX.n or 0) > 0 and _hj(_hQ, _hX.x, _hX.y) and (_hX.taking or _hp(_hX, _hU)) then
                _hV = true
                break
            end
        end
        if not _hV then
            return
        end
        task.wait()
    end
end

local function _hY()
    local _hZ = {}
    for _ia, _ib in ipairs(_fq()) do
        table.insert(_hZ, "(" .. _ib.dx .. "," .. _ib.dy .. ")")
    end
    return #_hZ > 0 and table.concat(_hZ, " ") or "-"
end
local _ic = nil

local function _id()
    if not _S.Status then
        return
    end
    local _ie, _if = _fe()
    local _ig = _D.SelectedId
    local _ih = "Status   : " .. (_D.Running and "JALAN" or "BERHENTI") .. "\nBlock    : " .. (_ig and (_dM(_ig) .. " x" .. _dP(_ig)) or "-") .. "\nKarakter : " .. (_ie and ("(" .. _ie .. "," .. _if .. ")") or "tidak di world") .. "\nTile     : " .. _hY() .. "\nPlace/Break/Collect : " .. _D.Placed .. " / " .. _D.Broken .. " / " .. _D.Collected .. (_D.CollectFail > 0 and (" (ditolak " .. _D.CollectFail .. ")") or "") .. "\nAksi     : " .. _D.LastAction
    if _ih == _ic then
        return
    end
    _ic = _ih
    task.defer(function()
        pcall(function()
            _S.Status:SetDesc(_ih)
        end)
    end)
end
local _ii = setmetatable({}, {
    __index = function()
        return 0
    end,
    __newindex = function()
    end
})
local _ij = setmetatable({l = _ii, k = {}}, {
    __index = function()
        return 0
    end,
    __newindex = function()
    end
})
local _ik
_ik = setmetatable({}, {
    __index = function()
        return _ik
    end,
    __newindex = function()
    end,
    __call = function()
        return _ik
    end,
})
local _il = {}

local function _im(_in, _io, _ip)
    if type(_in) == "table" and type(rawget(_in, _io)) == "function" then
        table.insert(_il, {_in, _io, rawget(_in, _io)})
        _in[_io] = _ip
    end
end

local function _iq(_ir)
    _D.LiteMode = _ir
    if _ir then
        if #_il == 0 then
            if _u then
                _im(_v, "spawn", function()
                    return _ij
                end)
            end
            if _A then
                _im(_B, "play", function()
                    return _ik
                end)
                _im(_B, "playAt", function()
                    return _ik
                end)
            end
        end
        for _is, _it in ipairs(_P.Particles) do
            pcall(function()
                for _iu, _iv in ipairs(_it.live) do
                    if typeof(_iv.l) == "Instance" then
                        _iv.l.Visible = false
                    end
                end
            end)
        end
    else
        for _iw, _ix in ipairs(_il) do
            pcall(function()
                _ix[1][_ix[2]] = _ix[3]
            end)
        end
        table.clear(_il)
    end
end
local _iy = nil

local function _iz(_iA, ...)
    if _E.InfJump and _iA == 4992 and not _N.active then
        return true
    end
    if _iy then
        return _iy(_iA, ...)
    end
    return false
end

local function _iB()
    local _iC = _P.World
    if not _iC then
        return
    end
    local _iD = rawget(_iC, "jammerOn")
    if _iD == _iz or type(_iD) ~= "function" then
        return
    end
    _iy = _iD
    _iC.jammerOn = _iz
end

local function _iE()
    local _iF = _P.World
    if _iF and rawget(_iF, "jammerOn") == _iz and _iy then
        _iF.jammerOn = _iy
    end
end

local function _iG(_iH)
    _E.InfJump = _iH
    if _iH then
        _iB()
    else
        _iE()
    end
end

local function _iI(_iJ)
    _E.Ghost = _iJ
    if not _iJ then
        _E.UpHeld, _E.DownHeld = false, false
        if _P.World then
            _P.World.ghost = false
        end
    end
    if _S.FlyPad then
        _S.FlyPad.Enabled = _iJ
    end
end

local function _iK(_iL)
    _E.Speed = math.clamp(math.floor(tonumber(_iL) or 100), 50, 500)
    if _E.Speed == 100 and _P.World then
        _P.World.speedScale = 1
    end
end
local _iM = nil

local function _iN(_iO, _iP, ...)
    if _N.active then
        if _iP == "keyLeft" then
            return _N.left
        end
        if _iP == "keyRight" then
            return _N.right
        end
        if _iP == "keyJump" then
            return _N.jump
        end
        if _iP == "keyDown" then
            return _N.down
        end
    end
    if _E.Ghost then
        if _iP == "keyDown" and _E.DownHeld then
            return true
        end
        if _iP == "keyJump" and _E.UpHeld then
            return true
        end
    end
    return _iM(_iO, _iP, ...)
end
if _w and type(_x) == "table" and type(rawget(_x, "isDown")) == "function" then
    _iM = rawget(_x, "isDown")
    _x.isDown = _iN
end
table.insert(_T, _h.Heartbeat:Connect(function()
    local _iQ = _P.World
    if not _iQ or not _e() then
        return
    end
    if _E.Speed ~= 100 then
        _iQ.speedScale = _E.Speed / 100
    end
    if _E.Ghost and _iQ.ghost ~= true then
        _iQ.ghost = true
    end
end))
local _iR

local function _iS(_iT)
    task.wait(math.max(_iT or 0, 10) / 1000)
    return _D.Running and _e()
end

local function _iU()
    local _iV = _fo() ~= "Break saja"
    if not _P.World then
        return "Data world belum ketemu. Tekan 'Hubungkan ke game'"
    end
    if next(_fk()) == nil then
        return "Pilih tile dulu di Grid Tile"
    end
    if not _fe() then
        return "Kamu belum masuk world"
    end
    if _iV and not _fm() then
        return "Pilih block dari inventori"
    end
    return nil
end

local function _iW()
    local _iX = _P.World
    local _iY = _iX and rawget(_iX, "raymanOn")
    if type(_iY) ~= "function" then
        return false
    end
    local _iZ, _ja = pcall(_iY)
    return _iZ and _ja == true
end
local _jb = {
    {1, 0},
    {-1, 0},
    {0, 1},
    {0, -1},
    {1, 1},
    {1, -1},
    {-1, 1},
    {-1, -1}
}

local function _jc(_jd, _je, _jf)
    local _jg = {}
    for _jh, _ji in ipairs(_jf) do
        _jg[_ji.x .. "," .. _ji.y] = _ji
    end
    local _jj, _jk = nil, nil
    for _jl, _jm in ipairs(_jb) do
        local _jn = {}
        for _jo = 1, 3 do
            local _jp = _jg[(_jd + _jm[1] * _jo) .. "," .. (_je + _jm[2] * _jo)]
            if _jp then
                _jn[#_jn + 1] = _jp
            end
        end
        if #_jn >= 2 and #_jn > (_jj and #_jj or 0) then
            _jj, _jk = _jn, _jm
        end
    end
    return _jj, _jk
end

local function _jq(_jr)
    local _js, _jt = pcall(_P.State)
    if not _js or type(_jt) ~= "table" or not _jt.x then
        return
    end
    if _r and type(_s) == "table" and _s.act then
        pcall(_s.act.send, {kind = 4, x = _jt.x + _jr[1], y = _jt.y - 0.475 + _jr[2]})
    end
end

local function _ju(_jv)
    local _jw = 0
    while _D.Running and _e() and _D.RunId == _jv do
        local _jx = _fo() ~= "Break saja"
        local _jy = _fo() ~= "Place saja"
        local _jz, _jA = _fe()
        if not _jz then
            _iR("Karakter tidak ditemukan (keluar world?)")
            return
        end
        local _jB = {}
        for _jC, _jD in ipairs(_fq()) do
            _jB[#_jB + 1] = {x = _jz + _jD.dx, y = _jA + _jD.dy}
        end
        local _jE, _jF = false, false
        if _jx then
            for _jG, _jH in ipairs(_jB) do
                if not _D.Running then
                    break
                end
                if _D.AutoCollect then
                    _hP(_jH, 0.5)
                end
                local _jI = _fS(_jH.x, _jH.y)
                if _jI == "habis" then
                    _jF = true
                    break
                elseif _jI == "place" then
                    _jE = true
                    if not _iS(_D.PlaceMs) then
                        break
                    end
                end
            end
        end
        if _jy then
            local _jJ = math.clamp(math.floor(_D.MultiTarget or 1), 1, 5)
            local _jK, _jL = 1, {}
            while _D.Running and _e() do
                while #_jL < _jJ and _jK <= #_jB do
                    local _jM = _jB[_jK]
                    _jK += 1
                    _jL[#_jL + 1] = {x = _jM.x, y = _jM.y, n = 0}
                end
                if #_jL == 0 then
                    break
                end
                local _jN, _jO = nil, nil
                if _jJ > 1 and _iW() then
                    _jN, _jO = _jc(_jz, _jA, _jL)
                end
                if not _jO then
                    _jN = {_jL[1]}
                end
                local _jP = os.clock()
                if _jO then
                    _jq(_jO)
                end
                local _jQ, _jR = false, false
                for _jS, _jT in ipairs(_jN) do
                    if not _D.Running then
                        break
                    end
                    if _jS > 1 then
                        task.wait(0.05)
                    end
                    local _jU = _gh(_jT.x, _jT.y)
                    _jT.n += 1
                    if _jU then
                        _jQ, _jE = true, true
                    end
                    if _jU == "broke" then
                        _jR = true
                    end
                    if _jU == nil or _jT.n > 80 or (_jU == "broke" and not _gc(_jT.x, _jT.y)) then
                        _jT.done = true
                    end
                    _jT.used = true
                end
                local _jV = {}
                for _jW, _jX in ipairs(_jL) do
                    if not _jX.done and not _jX.used then
                        _jV[#_jV + 1] = _jX
                    end
                end
                for _jY, _jZ in ipairs(_jN) do
                    _jZ.used = nil
                    if not _jZ.done then
                        _jV[#_jV + 1] = _jZ
                    end
                end
                _jL = _jV
                if _jQ then
                    local _ka = _D.BreakMs / 1000
                    if _jO then
                        _ka = math.max(_ka, 0.35)
                    end
                    local _kb = _ka - (os.clock() - _jP)
                    if _kb > 0.005 then
                        task.wait(_kb)
                    end
                    if not (_D.Running and _e()) then
                        break
                    end
                end
                if _jR and _D.AfterBreakMs > 0 then
                    task.wait(_D.AfterBreakMs / 1000)
                end
            end
        end
        if not _D.Running or not _e() then
            break
        end
        if not _jE then
            local _kc = _fm()
            if _jF or (_jx and _kc and _dP(_kc) <= 0) then
                _iR("Block " .. _dM(_kc) .. " di inventori habis")
                return
            end
            if not _iS(_D.BreakMs) then
                break
            end
        end
        _D.Cycles += 1
        if os.clock() - _jw > 1 then
            _jw = os.clock()
            _id()
        end
    end
    _id()
end

local function _kd()
    if _D.Override then
        return
    end
    if _S.FarmToggle then
        pcall(function()
            _S.FarmToggle:Set(_D.Running)
        end)
    end
    if _S.GridStart and _S.GridMode ~= "pabrik" then
        _S.GridStart.Text = _D.Running and "STOP" or "START"
        _S.GridStart.BackgroundColor3 = _D.Running and Color3.fromRGB(200, 60, 60) or Color3.fromRGB(46, 160, 90)
    end
end
_iR = function(_ke)
    _D.Running = false
    _kd()
    if _ke and not _D.Quiet then
        _bH("Auto Farm berhenti", _ke, 4)
        _cz.send("stop", "Auto Farm berhenti: " .. _ke)
    end
    _id()
end
local _kf, _kg

local function _kh()
    if _D.Running then
        return
    end
    local _ki = _iU()
    if _ki then
        _iR(_ki)
        return
    end
    if _H.Running and _H.stop then
        _H.stop("Dihentikan karena Auto Farm dimulai")
    end
    if _K.Running and _K.stop then
        _K.stop("Dihentikan karena Auto Farm dimulai")
    end
    if _J.Running and _J.stop then
        _J.stop("Dihentikan karena Auto Farm dimulai")
    end
    if _F.Running and _kf then
        _kf("Dihentikan karena Auto Farm dimulai")
    end
    if _M.Running and _kg then
        _kg("Dihentikan karena Auto Farm dimulai")
    end
    table.clear(_U)
    table.clear(_V)
    _D.Running = true
    _D.RunId = (_D.RunId or 0) + 1
    _kd()
    _id()
    task.spawn(_ju, _D.RunId)
end
local _kj = {} do
    (function()
        local _kk, _kl = math.floor, math.abs
        local _km = {Placed = 0}
        local _kn = {}
        local _ko, _kp = {}, {}
        local _kq = {}
        local _kr = nil
        local function _ks()
            return (_F.Running or _M.Running or _H.Roaming or _K.Running or _J.Running or _km.Homing) and _e()
        end
        local function _kt(_ku)
            if _F.Running then
                _F.Status = _ku
            elseif _M.Running then
                _M.Status = _ku
            elseif _H.Roaming then
                _H.Status = _ku
            elseif _J.Running then
                _J.Status = _ku
            elseif _K.Running then
                _K.Status = _ku
            end
        end
        local function _kv(_kw, _kx, _ky)
            _kw[_kx] = os.clock() + (_ky or 30)
        end
        local function _kz(_kA, _kB, _kC)
            local _kD = _kA[_kB]
            if not _kD then
                return false
            end
            if (_kC or os.clock()) >= _kD then
                _kA[_kB] = nil
                return false
            end
            return true
        end
        local function _kE(_kF)
            local _kG, _kH = 0, os.clock()
            for _kI, _kJ in pairs(_kF) do
                if _kJ > _kH then
                    _kG += 1
                end
            end
            return _kG
        end
        local function _kK(_kL, _kM)
            local _kN = _P.Hud and _P.Hud[_kL]
            if type(_kN) == "function" then
                local _kO, _kP = pcall(_kN)
                if _kO and type(_kP) == "number" and _kP > 0 then
                    return _kP
                end
            end
            return _kM
        end
        local function _kQ()
            return _kK("punchRange", 2.5)
        end
        local function _kR()
            return _kK("buildRange", 2.5)
        end
        local function _kS()
            if not _P.State then
                return nil
            end
            local _kT, _kU = pcall(_P.State)
            if _kT and type(_kU) == "table" and type(_kU.x) == "number" and type(_kU.y) == "number" and _kU.active ~= false then
                return _kU
            end
            return nil
        end
        local function _kV(_kW, _kX)
            local _kY = _P.World
            local _kZ = _kY and _kY.fg[_kX]
            return (_kZ and _kZ[_kW]) or 0
        end
        local function _la(_lb, _lc)
            local _ld = _kV(_lb, _lc)
            if _ld ~= 0 then
                return _p[_ld]
            end
            return nil
        end
        local function _le(_lf, _lg)
            local _lh = _P.World
            if not _lh then
                return true
            end
            if _lf < 0 or _lf >= _lh.w or _lg >= _lh.h then
                return true
            end
            if _lg < 0 then
                return false
            end
            local _li = _la(_lf, _lg)
            if not _li then
                return false
            end
            if _li.combiner then
                local _lj, _lk = pcall(_lh.combinerShut, _lf, _lg)
                return (not _lj) or (_lk and true or false)
            end
            if _li.vip then
                local _ll, _lm = pcall(_lh.vipMay, _lf, _lg)
                return not (_ll and _lm)
            end
            if _li.entrance then
                local _ln = _lh.switches and _lh.switches[_lg * _lh.w + _lf]
                if _li.gate then
                    return not (_ln and _ln.off == true)
                end
                if _ln and _ln.public then
                    return false
                end
                local _lo, _lp = pcall(function()
                    return _lh.areas.mayBuild(_lh.lock, _lf, _lg)
                end)
                return not (_lo and _lp)
            end
            return _li.solid and true or false
        end
        local function _lq(_lr, _ls)
            local _lt = _la(_lr, _ls)
            return _lt ~= nil and (_lt.deadly or _lt.hurts or _lt.laser) and true or false
        end
        local function _lu(_lv, _lw)
            local _lx = _la(_lv, _lw)
            return _lx ~= nil and _lx.platform and true or false
        end
        local function _ly(_lz, _lA)
            return not _le(_lz, _lA) and not _lq(_lz, _lA)
        end
        local function _lB(_lC, _lD)
            return not _lq(_lC, _lD + 1) and (_le(_lC, _lD + 1) or _lu(_lC, _lD + 1))
        end
        local function _lE(_lF, _lG, _lH, _lI)
            return _kl(_lG + 0.5 - _lF.x) <= _lI and _kl(_lH + 0.5 - (_lF.y - 0.475)) <= _lI
        end
        local function _lJ(_lK, _lL)
            local _lM = _P.World
            local _lN, _lO = pcall(function()
                if _lM.areas and type(_lM.areas.mayBuild) == "function" and not _lM.areas.mayBuild(_lM.lock, _lK, _lL) then
                    return false
                end
                if type(_lM.builderOk) == "function" and not _lM.builderOk(_lK, _lL, false) then
                    return false
                end
                return true
            end)
            return (not _lN) or _lO
        end
        local function _lP()
            local _lQ, _lR
            if _F.Running then
                _lQ, _lR = _F.ScaffoldId, _F.UseBlock
            elseif _M.Running then
                _lQ, _lR = _M.ScaffoldId, _M.UseBlock
            elseif _J.Running then
                _lQ, _lR = _J.BlockId, _J.UseBlock
            end
            if _lR and _lQ and _dP(_lQ) > 0 then
                return _lQ
            end
            return nil
        end
        local function _lS(_lT, _lU)
            local _lV = _P.World
            if not _lV or _lT < 0 or _lU < 0 or _lT >= _lV.w or _lU >= _lV.h then
                return false
            end
            if _kV(_lT, _lU) ~= 0 then
                return false
            end
            local _lW, _lX = pcall(function()
                if _lV.areas and type(_lV.areas.canEdit) == "function" and not _lV.areas.canEdit(_lT, _lU) then
                    return false
                end
                if type(_lV.builderOk) == "function" and not _lV.builderOk(_lT, _lU, true) then
                    return false
                end
                return true
            end)
            return (not _lW) or _lX
        end
        local function _lY(_lZ, _ma)
            local _mb = _lP()
            if not _mb or not _lS(_lZ, _ma) then
                return false
            end
            local _mc = _kS()
            if not _mc or not _lE(_mc, _lZ, _ma, _kR() - 0.05) then
                return false
            end
            _fx("fg", _lZ, _ma, _mb)
            if _P.Inv then
                pcall(function()
                    _P.Inv:remove(_mb, 1)
                end)
            end
            _km.Placed += 1
            return true
        end
        local function _md()
            return _F.Broken + _M.Harvested + _M.Planted + _km.Placed + _H.Planted
        end
        local function _me(_mf)
            local _mg = _kk(_mf.y - 0.475)
            local _mh = _kk(_mf.x)
            if _lB(_mh, _mg) then
                return _mh, _mg
            end
            local _mi, _mj = _kk(_mf.x - 0.3), _kk(_mf.x + 0.3 - 0.0001)
            for _mk, _ml in ipairs({_mi, _mj}) do
                if _ml ~= _mh and _lB(_ml, _mg) then
                    return _ml, _mg
                end
            end
            return _mh, _mg
        end
        local function _mm(_mn, _mo, _mp, _mq, _mr)
            _mp += 1
            local _ms = _mp
            while _ms > 1 do
                local _mt = _ms // 2
                if _mn[_mt] <= _mq then
                    break
                end
                _mn[_ms], _mo[_ms] = _mn[_mt], _mo[_mt]
                _ms = _mt
            end
            _mn[_ms], _mo[_ms] = _mq, _mr
            return _mp
        end
        local function _mu(_mv, _mw, _mx)
            local _my = _mw[1]
            local _mz, _mA = _mv[_mx], _mw[_mx]
            _mv[_mx], _mw[_mx] = nil, nil
            _mx -= 1
            if _mx > 0 then
                local _mB = 1
                while true do
                    local _mC = _mB * 2
                    if _mC > _mx then
                        break
                    end
                    if _mC < _mx and _mv[_mC + 1] < _mv[_mC] then
                        _mC += 1
                    end
                    if _mz <= _mv[_mC] then
                        break
                    end
                    _mv[_mB], _mw[_mB] = _mv[_mC], _mw[_mC]
                    _mB = _mC
                end
                _mv[_mB], _mw[_mB] = _mz, _mA
            end
            return _my, _mx
        end
        local _mD = 8000
        local _mE = 2
        local function _mF(_mG)
            return _kk(_mG), math.ceil(-_mG + 0.025), _kk(_mG + 0.025)
        end
        local function _mH(_mI, _mJ, _mK, _mL, _mM, _mN, _mO)
            local _mP = _P.World
            if not _mP then
                return nil, false, {}
            end
            local _mQ, _mR = _mP.w, _mP.h
            local _mS = _mQ * _mR
            local _mT, _mU, _mV = _mF(_mN)
            local _mW, _mX, _mY = {}, {}, {}
            local function _mZ(_na, _nb)
                if _na < 0 or _na >= _mQ or _nb >= _mR then
                    return false
                end
                if _nb < 0 then
                    return true
                end
                local _nc = _nb * _mQ + _na
                local _nd = _mW[_nc]
                if _nd == nil then
                    _nd = _ly(_na, _nb)
                    _mW[_nc] = _nd
                end
                return _nd
            end
            local function _ne(_nf, _ng)
                if _nf < 0 or _nf >= _mQ or _ng < 0 or _ng >= _mR then
                    return false
                end
                local _nh = _ng * _mQ + _nf
                local _ni = _mX[_nh]
                if _ni == nil then
                    _ni = _lB(_nf, _ng)
                    _mX[_nh] = _ni
                end
                return _ni
            end
            local function _nj(_nk, _nl)
                if not _mO or _nk < 0 or _nk >= _mQ or _nl < 0 or _nl >= _mR then
                    return false
                end
                local _nm = _nl * _mQ + _nk
                local _nn = _mY[_nm]
                if _nn == nil then
                    _nn = _lS(_nk, _nl)
                    _mY[_nm] = _nn
                end
                return _nn
            end
            local function _no(_np, _nq)
                local _nr = _kl(_mL - _np) - _mN
                local _ns = _mM - _nq
                local _nt = _kl(_ns) - _mN
                local _nu = (_ns < 0) and 1.5 or 0.5
                return (_nr > 0 and _nr or 0) + _nu * (_nt > 0 and _nt or 0)
            end
            local function _nv(_nw, _nx)
                for _ny = _nx + _mU, _nx + _mV do
                    if _ny >= 0 and _ny < _mR then
                        local _nz = _ny * _mQ
                        for _nA = _nw - _mT, _nw + _mT do
                            if _nA >= 0 and _nA < _mQ and _mK[_nz + _nA] and not (_nA == _nw and _ny == _nx + 1) then
                                return true
                            end
                        end
                    end
                end
                return false
            end
            local _nB, _nC, _nD, _nE, _nF = {}, {}, {}, {}, {}
            local _nG = 0
            local function _nH(_nI, _nJ, _nK, _nL, _nM)
                _nG += 1
                _nB[_nG], _nC[_nG], _nD[_nG], _nE[_nG], _nF[_nG] = _nI, _nJ, _nK, _nL, _nM
            end
            local function _nN(_nO, _nP)
                _nG = 0
                for _nQ = -1, 1, 2 do
                    local _nR = _nO + _nQ
                    if _mZ(_nR, _nP) then
                        if _ne(_nR, _nP) then
                            _nH(_nR, _nP, "walk", 1, false)
                        else
                            if _nj(_nR, _nP + 1) then
                                _nH(_nR, _nP, "walk", 1 + _mE, true)
                            end
                            local _nS = _nP + 1
                            while _nS < _mR and _nS - _nP <= 40 and _mZ(_nR, _nS) and not _ne(_nR, _nS) do
                                _nS += 1
                            end
                            if _nS < _mR and _mZ(_nR, _nS) and _ne(_nR, _nS) then
                                _nH(_nR, _nS, "fall", 1 + 0.5 * (_nS - _nP), false)
                            end
                            if _mZ(_nO, _nP - 1) and _mZ(_nO, _nP - 2) then
                                for _nT = 2, 3 do
                                    local _nU = _nO + (_nT - 1) * _nQ
                                    if not (_mZ(_nU, _nP) and _mZ(_nU, _nP - 1) and _mZ(_nU, _nP - 2)) then
                                        break
                                    end
                                    if _nT == 3 and _ne(_nU, _nP) then
                                        break
                                    end
                                    local _nV = _nO + _nT * _nQ
                                    if _mZ(_nV, _nP - 1) and _mZ(_nV, _nP - 2) then
                                        for _nW = 0, 2 do
                                            if not _mZ(_nV, _nP + _nW) then
                                                break
                                            end
                                            if _ne(_nV, _nP + _nW) then
                                                _nH(_nV, _nP + _nW, "gap", _nT + 0.5 + 0.5 * _nW, false)
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    for _nX = 1, 3 do
                        if not _mZ(_nO, _nP - _nX) then
                            break
                        end
                        if _mZ(_nO, _nP - _nX - 1) and _mZ(_nR, _nP - _nX) and _ne(_nR, _nP - _nX) and _mZ(_nR, _nP - _nX - 1) then
                            _nH(_nR, _nP - _nX, "jump", 1 + 1.5 * _nX, false)
                        end
                    end
                end
                if _mO and _mZ(_nO, _nP - 1) and _mZ(_nO, _nP - 2) and _mZ(_nO, _nP - 3) and _nj(_nO, _nP) then
                    _nH(_nO, _nP - 1, "pillar", 2 + _mE, true)
                end
                return _nG
            end
            local _nY = _mJ * _mQ + _mI
            local _nZ, _oa, _ob, _oc, _od = {[_nY] = 0}, {}, {}, {}, {}
            local _oe, _of, _og = {}, {}, 0
            _og = _mm(_oe, _of, _og, _no(_mI, _mJ), _nY)
            local _oh = 0
            local _oi = os.clock()
            while _og > 0 do
                local _oj
                _oj, _og = _mu(_oe, _of, _og)
                if not _od[_oj] then
                    _od[_oj] = true
                    local _ok, _ol = _oj % _mQ, _oj // _mQ
                    if _nv(_ok, _ol) then
                        local _om = {}
                        local _on = _oj
                        while _on ~= _nY do
                            local _oo = _oa[_on]
                            table.insert(_om, 1, {
                                fx = _oo % _mQ,
                                fy = _oo // _mQ,
                                x = _on % _mQ,
                                y = _on // _mQ,
                                kind = _ob[_on],
                                build = _oc[_on],
                                key = _oo * _mS + _on,
                            })
                            _on = _oo
                        end
                        return _om, false, _od
                    end
                    _oh += 1
                    if _oh > _mD then
                        return nil, false, _od
                    end
                    if _oh % 400 == 0 then
                        task.wait()
                        if not _ks() then
                            return nil, false, _od
                        end
                    end
                    local _op = _nZ[_oj]
                    local _oq = _nN(_ok, _ol)
                    for _or = 1, _oq do
                        local _os = _nC[_or] * _mQ + _nB[_or]
                        if not _od[_os] then
                            local _ot = _kn[_oj * _mS + _os]
                            if not (_ot and _ot > _oi) then
                                local _ou = _op + _nE[_or]
                                local _ov = _nZ[_os]
                                if _ov == nil or _ou < _ov then
                                    _nZ[_os], _oa[_os], _ob[_os], _oc[_os] = _ou, _oj, _nD[_or], _nF[_or]
                                    _og = _mm(_oe, _of, _og, _ou + _no(_nB[_or], _nC[_or]), _os)
                                end
                            end
                        end
                    end
                end
            end
            return nil, true, _od
        end
        local function _ow(_ox, _oy, _oz)
            local _oA = {}
            local _oB, _oC, _oD = _mF(_oz)
            local _oE = 0
            for _oF in pairs(_ox) do
                local _oG, _oH = _oF % _oy, _oF // _oy
                for _oI = _oC, _oD do
                    local _oJ = _oH + _oI
                    if _oJ >= 0 then
                        local _oK = _oJ * _oy
                        for _oL = -_oB, _oB do
                            local _oM = _oG + _oL
                            if _oM >= 0 and _oM < _oy then
                                _oA[_oK + _oM] = true
                            end
                        end
                    end
                end
                _oE += 1
                if _oE % 500 == 0 then
                    task.wait()
                end
            end
            return _oA
        end
        local function _oN(_oO, _oP, _oQ)
            local _oR = _kr
            if _oR and _oR.world == _P.World and _oR.start == _oO and _oR.R == _oP and _oR.block == _oQ and _oR.ver == _md() and os.clock() - _oR.at < 30 then
                return _oR.set
            end
            return nil
        end
        local function _oS(_oT, _oU, _oV, _oW)
            _kr = {
                world = _P.World,
                start = _oT,
                R = _oU,
                block = _oV,
                ver = _md(),
                at = os.clock(),
                set = _ow(_oW, _P.World.w, _oU),
            }
        end
        local function _oX()
            _N.left, _N.right, _N.jump, _N.down = false, false, false, false
        end
        local function _oY()
            task.wait()
            return _ks()
        end
        local function _oZ(_pa)
            task.wait(math.max(_pa or 0, 30) / 1000)
            return _ks()
        end
        local function _pb(_pc, _pd, _pe)
            local _pf = _pd - _pc.x
            local _pg = _pc.vx or 0
            local _ph = _pc.grounded and 48 or 17
            local _pi = 0
            if _kl(_pf) > _pe then
                _pi = _pf > 0 and 1 or -1
                if _pg * _pi > 0 and (_pg * _pg) / (2 * _ph) >= _kl(_pf) - _pe * 0.5 then
                    _pi = 0
                end
            end
            _N.left = _pi < 0
            _N.right = _pi > 0
        end
        local function _pj(_pk, _pl)
            local _pm = _pk + 0.5
            local _pn = _kS()
            if not _pn then
                return false
            end
            local _po = 1.5 + _kl(_pm - _pn.x) * 0.35
            local _pp = os.clock()
            while _oY() do
                local _pq = _kS()
                if not _pq or _pq.dead then
                    return false
                end
                local _pr, _ps = _kk(_pq.x), _kk(_pq.y - 0.475)
                if _pq.grounded and _ps ~= _pl then
                    return false
                end
                _pb(_pq, _pm, 0.1)
                if _pr == _pk and _kl(_pq.x - _pm) <= 0.2 and _pq.grounded and _kl(_pq.vx or 0) < 2 then
                    _N.left, _N.right = false, false
                    return true
                end
                if os.clock() - _pp > _po then
                    return false
                end
            end
            return false
        end
        local function _pt(_pu)
            local _pv = _pu.x + 0.5
            local _pw = 1.5 + 0.3 * (_pu.y - _pu.fy)
            local _px = os.clock()
            while _oY() do
                local _py = _kS()
                if not _py or _py.dead then
                    return false
                end
                _pb(_py, _pv, 0.1)
                if _py.grounded then
                    local _pz, _pA = _kk(_py.x), _kk(_py.y - 0.475)
                    if _pA == _pu.y then
                        if _pz == _pu.x and _kl(_py.x - _pv) <= 0.25 then
                            return true
                        end
                    elseif _pA ~= _pu.fy then
                        return false
                    end
                end
                if os.clock() - _px > _pw then
                    return false
                end
            end
            return false
        end
        local function _pB(_pC)
            if not _pj(_pC.fx, _pC.fy) then
                return false
            end
            local _pD = _pC.fy - _pC.y
            local _pE = _pC.y + 1
            local _pF = _pE - ((_pD == 1) and 0 or 0.4)
            local _pG = _pC.x + 0.5
            _oX()
            if not _oY() then
                return false
            end
            _N.jump = true
            local _pH = os.clock()
            local _pI = false
            while _oY() do
                local _pJ = _kS()
                if not _pJ or _pJ.dead then
                    return false
                end
                if not _pJ.grounded then
                    _pI = true
                end
                if _N.jump and (_pJ.y <= _pF or (_pI and (_pJ.vy or 0) >= 0)) then
                    _N.jump = false
                end
                if _pJ.y <= _pE + 0.25 then
                    _pb(_pJ, _pG, 0.1)
                else
                    _pb(_pJ, _pC.fx + 0.5, 0.15)
                end
                if _pI and _pJ.grounded then
                    local _pK, _pL = _kk(_pJ.x), _kk(_pJ.y - 0.475)
                    if _pL == _pC.y then
                        if _pK == _pC.x and _kl(_pJ.x - _pG) <= 0.25 then
                            _N.jump = false
                            return true
                        end
                    else
                        return false
                    end
                end
                if not _pI and os.clock() - _pH > 0.35 then
                    return false
                end
                if os.clock() - _pH > 1.8 then
                    return false
                end
            end
            return false
        end
        local function _pM(_pN)
            if not _pj(_pN.fx, _pN.fy) then
                return false
            end
            local _pO = _kS()
            if not _pO then
                return false
            end
            local _pP = (_pN.x > _pN.fx) and 1 or -1
            local _pQ = _pN.fx + 0.5 + _pP * 0.6
            local _pR = _pO.y
            local _pS = _pN.x + 0.5
            _oX()
            local _pT = os.clock()
            local _pU, _pV, _pW = false, false, 0
            while _oY() do
                local _pX = _kS()
                if not _pX or _pX.dead then
                    return false
                end
                if not _pU then
                    _N.left, _N.right = _pP < 0, _pP > 0
                    if (_pX.x - _pQ) * _pP >= 0 or not _pX.grounded then
                        _pU, _pW = true, os.clock()
                        _N.jump = _pX.grounded
                    end
                else
                    if not _pX.grounded then
                        _pV = true
                    end
                    if _N.jump and (_pX.y <= _pR - 1 or (_pV and (_pX.vy or 0) >= 0)) then
                        _N.jump = false
                    end
                    _pb(_pX, _pS, 0.1)
                    if _pV and _pX.grounded then
                        local _pY, _pZ = _kk(_pX.x), _kk(_pX.y - 0.475)
                        if _pZ == _pN.y then
                            if _pY == _pN.x and _kl(_pX.x - _pS) <= 0.25 then
                                return true
                            end
                        else
                            return false
                        end
                    end
                    if not _pV and os.clock() - _pW > 0.35 then
                        return false
                    end
                end
                if os.clock() - _pT > 2.2 then
                    return false
                end
            end
            return false
        end
        local function _qa(_qb)
            if not _pj(_qb.fx, _qb.fy) then
                return false
            end
            if _kV(_qb.fx, _qb.fy) ~= 0 then
                return false
            end
            _oX()
            if not _oY() then
                return false
            end
            _N.jump = true
            local _qc = os.clock()
            local _qd, _qe = false, false
            while _oY() do
                local _qf = _kS()
                if not _qf or _qf.dead then
                    return false
                end
                if not _qf.grounded then
                    _qe = true
                end
                _pb(_qf, _qb.fx + 0.5, 0.12)
                if _N.jump and (_qf.y < _qb.fy - 0.9 or (_qe and (_qf.vy or 0) >= 0)) then
                    _N.jump = false
                end
                if not _qd and _qe and _qf.y < _qb.fy - 0.25 and ((_qf.vy or 0) > -6 or _qf.y < _qb.fy - 0.8) then
                    _qd = _lY(_qb.fx, _qb.fy)
                    if not _qd then
                        return false
                    end
                end
                if _qf.grounded and _qe then
                    local _qg, _qh = _kk(_qf.x), _kk(_qf.y - 0.475)
                    return _qd and _qg == _qb.x and _qh == _qb.y
                end
                if not _qe and os.clock() - _qc > 0.35 then
                    return false
                end
                if os.clock() - _qc > 1.8 then
                    return false
                end
            end
            return false
        end
        local function _qi(_qj)
            local _qk = 1
            while _qk <= #_qj do
                if not _ks() then
                    return false
                end
                local _ql = _qj[_qk]
                local _qm, _qn = _qk, false
                if _ql.kind == "walk" then
                    local _qo = _ql.x - _ql.fx
                    while _qj[_qm + 1] and _qj[_qm + 1].kind == "walk" and (_qj[_qm + 1].x - _qj[_qm + 1].fx) == _qo do
                        _qm += 1
                    end
                    local _qp = false
                    for _qq = _qk, _qm do
                        if _qj[_qq].build then
                            _qp = true
                            break
                        end
                    end
                    if _qp then
                        _qn = true
                        for _qr = _qk, _qm do
                            local _qs = _qj[_qr]
                            if _qs.build and not _lB(_qs.x, _qs.y) then
                                _kt(("Taruh block pijakan (%d,%d)"):format(_qs.x, _qs.y + 1))
                                if not _lY(_qs.x, _qs.y + 1) or not _oZ(120) then
                                    _qn = false
                                    break
                                end
                            end
                            if not _pj(_qs.x, _qs.y) then
                                _qn = false
                                break
                            end
                        end
                    else
                        _kt(("Jalan ke (%d,%d)"):format(_qj[_qm].x, _qj[_qm].y))
                        _qn = _pj(_qj[_qm].x, _qj[_qm].y)
                    end
                elseif _ql.kind == "pillar" then
                    _kt(("Naik pakai block ke (%d,%d)"):format(_ql.x, _ql.y))
                    _qn = _qa(_ql)
                elseif _ql.kind == "fall" then
                    _kt(("Turun ke (%d,%d)"):format(_ql.x, _ql.y))
                    _qn = _pt(_ql)
                elseif _ql.kind == "jump" then
                    _kt(("Lompat ke (%d,%d)"):format(_ql.x, _ql.y))
                    _qn = _pB(_ql)
                elseif _ql.kind == "gap" then
                    _kt(("Lompati lubang ke (%d,%d)"):format(_ql.x, _ql.y))
                    _qn = _pM(_ql)
                end
                _oX()
                if not _qn then
                    _kn[_ql.key] = os.clock() + 20
                    return false
                end
                _qk = _qm + 1
            end
            return true
        end
        local function _qt(_qu, _qv, _qw, _qx, _qy, _qz, _qA)
            local _qB = _P.World
            local _qC = {}
            for _qD, _qE in ipairs(_qw) do
                _qC[_qE.idx] = true
            end
            local _qF = _qw[1]
            _kt(("Cari jalan A* ke (%d,%d)"):format(_qF.x, _qF.y))
            local _qG, _qH, _qI = _mH(_qu, _qv, _qC, _qF.x, _qF.y, _qx, _qy)
            if _qG then
                if #_qG == 0 then
                    for _qJ, _qK in ipairs(_qw) do
                        _kv(_qz, _qK.idx, 20)
                    end
                elseif not _qi(_qG) then
                    _qA[_qF.idx] = (_qA[_qF.idx] or 0) + 1
                    if _qA[_qF.idx] >= 3 then
                        for _qL, _qM in ipairs(_qw) do
                            _kv(_qz, _qM.idx, 40)
                        end
                    end
                end
                _oX()
                return true
            end
            for _qN, _qO in ipairs(_qw) do
                _kv(_qz, _qO.idx, _qH and 60 or 30)
            end
            if _qH and _qB then
                _oS(_qv * _qB.w + _qu, _qx, _qy, _qI)
            end
            _oX()
            return false
        end
        local function _qP()
            _N.active = true
            _oX()
            _kr = nil
            if _E.Ghost then
                _iI(false)
                if _S.GhostToggle then
                    pcall(function()
                        _S.GhostToggle:Set(false)
                    end)
                end
            end
        end
        local function _qQ()
            if _F.Running or _M.Running or _H.Roaming or _K.Running or _J.Running or _km.Homing then
                return
            end
            _N.active = false
            _oX()
        end
        local function _qR(_qS, _qT)
            if not _qS then
                return "mati"
            end
            if not _qT then
                return "belum dipilih"
            end
            local _qU = _dP(_qT)
            return _dM(_qT) .. " x" .. _qU .. (_qU <= 0 and " (habis)" or "")
        end
        local function _qV(_qW)
            if not _qW or _qW == 0 then
                return false
            end
            local _qX = _p[_qW]
            if not _qX then
                return false
            end
            if _qX.lock or _qX.area or _qX.guildLock or _qX.vend or _qX.display then
                return false
            end
            local _qY = (_qX.kind == "seed") and 20 or _qX.hits
            if type(_qY) == "number" and _qY > 0 then
                return true
            end
            local _qZ = _P.World
            return (_qX.staffHits and _qZ and _qZ.areas and _qZ.areas.staff) and true or false
        end
        local function _ra(_rb, _rc)
            local _rd = _P.World
            local _re = _rd and _rd.spawn
            if _re ~= nil and (typeof(_re) == "Vector2" or type(_re) == "table") and _rb == _re.X and _rc == _re.Y then
                return nil
            end
            local _rf = _eR("fg", _rb, _rc)
            if _rf == nil then
                return nil
            end
            if _rf ~= 0 then
                if _qV(_rf) then
                    return "fg", _rf
                end
                return nil
            end
            if _F.IncludeBg then
                local _rg = _eR("bg", _rb, _rc)
                if _rg and _rg ~= 0 and _qV(_rg) then
                    return "bg", _rg
                end
            end
            return nil
        end
        local function _rh()
            local _ri = _P.World
            local _rj, _rk = _ri.w, _ri.h
            local _rl = os.clock()
            for _rm = 0, _rk - 1 do
                local _rn, _ro = _ri.fg[_rm], _ri.bg[_rm]
                for _rp = 0, _rj - 1 do
                    local _rq = _rn and _rn[_rp] or 0
                    local _rr = _ro and _ro[_rp] or 0
                    if (_rq ~= 0 or (_F.IncludeBg and _rr ~= 0)) and _ra(_rp, _rm) and not _kz(_F.Skip, _rm * _rj + _rp, _rl) then
                        return _rm
                    end
                end
            end
            return nil
        end
        local function _rs()
            local _rt = _P.World
            if not _rt then
                return -1
            end
            local _ru, _rv = _rt.w, _rt.h
            local _rw, _rx = 0, 0
            for _ry = 0, _rv - 1 do
                local _rz, _rA = _rt.fg[_ry], _rt.bg[_ry]
                for _rB = 0, _ru - 1 do
                    local _rC = _rz and _rz[_rB] or 0
                    local _rD = _rA and _rA[_rB] or 0
                    if (_rC ~= 0 or (_F.IncludeBg and _rD ~= 0)) and _ra(_rB, _ry) then
                        _rw += 1
                    end
                end
                _rx += _ru
                if _rx >= 8000 then
                    _rx = 0
                    task.wait()
                end
            end
            return _rw
        end
        local function _rE(_rF, _rG)
            if _F.Sweep ~= "Zig-zag" then
                return 1
            end
            if _F.DirRow == _rF and _F.Dir then
                return _F.Dir
            end
            local _rH = _P.World
            local _rI = os.clock()
            local _rJ, _rK
            for _rL = _rF, math.min(_rF + 1, _rH.h - 1) do
                for _rM = 0, _rH.w - 1 do
                    if _ra(_rM, _rL) and not _kz(_F.Skip, _rL * _rH.w + _rM, _rI) then
                        if not _rJ or _rM < _rJ then
                            _rJ = _rM
                        end
                        if not _rK or _rM > _rK then
                            _rK = _rM
                        end
                    end
                end
            end
            local _rN = 1
            if _rJ and _rK and _kl(_rG.x - _rK) < _kl(_rG.x - _rJ) then
                _rN = -1
            end
            _F.DirRow, _F.Dir = _rF, _rN
            return _rN
        end
        local function _rO(_rP, _rQ, _rR, _rS)
            local _rT = _P.World
            local _rU = _rT.w
            local _rV = {}
            local _rW = os.clock()
            for _rX = _rP, math.min(_rQ, _rT.h - 1) do
                for _rY = 0, _rU - 1 do
                    local _rZ = _rX * _rU + _rY
                    if _ra(_rY, _rX) and not _kz(_F.Skip, _rZ, _rW) then
                        if _rS and not _rS[_rZ] then
                            _kv(_F.Skip, _rZ, 60)
                        elseif _lJ(_rY, _rX) then
                            _rV[#_rV + 1] = {x = _rY, y = _rX, idx = _rZ}
                        else
                            _kv(_F.Skip, _rZ, 300)
                        end
                    end
                end
            end
            table.sort(_rV, function(_sa, _sb)
                if _sa.x ~= _sb.x then
                    return _sa.x * _rR < _sb.x * _rR
                end
                return _sa.y < _sb.y
            end)
            return _rV
        end
        local function _sc(_sd, _se, _sf)
            local _sg = _P.World
            local _sh = _sg.w
            local _si = _kQ() - 0.08
            local _sj, _sk = _sd.x, _sd.y - 0.475
            local _sl = _kk(_sd.y + 0.01)
            local _sm, _sn = _kk(_sd.x - 0.3), _kk(_sd.x + 0.3 - 0.0001)
            local _so = os.clock()
            local _sp = {}
            for _sq = math.max(0, _kk(_sk - _si - 0.5)), math.min(_kk(_sk + _si + 0.5), _se, _sg.h - 1) do
                for _sr = math.max(0, _kk(_sj - _si - 0.5)), math.min(_kk(_sj + _si + 0.5), _sh - 1) do
                    if _lE(_sd, _sr, _sq, _si) then
                        local _ss = _sq * _sh + _sr
                        if not _kz(_F.Skip, _ss, _so) and _ra(_sr, _sq) then
                            if _lJ(_sr, _sq) then
                                _sp[#_sp + 1] = {x = _sr, y = _sq, idx = _ss, support = (_sq == _sl and _sr >= _sm and _sr <= _sn),}
                            else
                                _kv(_F.Skip, _ss, 300)
                            end
                        end
                    end
                end
            end
            table.sort(_sp, function(_st, _su)
                if _st.support ~= _su.support then
                    return not _st.support
                end
                if _st.x ~= _su.x then
                    return _st.x * _sf < _su.x * _sf
                end
                return _st.y < _su.y
            end)
            return _sp
        end
        local function _sv(_sw, _sx, _sy)
            local _sz, _sA = _kk(_sw.x - 0.3), _kk(_sw.x + 0.3 - 0.0001)
            for _sB = _sz, _sA do
                if _sB ~= _sx and (_le(_sB, _sy) or _lu(_sB, _sy)) then
                    return 0
                end
            end
            local _sC = _P.World
            for _sD = _sy + 1, math.min(_sC.h - 1, _sy + 60) do
                if _lq(_sx, _sD) then
                    return nil
                end
                if _le(_sx, _sD) or _lu(_sx, _sD) then
                    return _sD - _sy
                end
            end
            return 60
        end
        local function _sE(_sF)
            local _sG, _sH, _sI = _sF.x, _sF.y, _sF.idx
            local _sJ, _sK = _ra(_sG, _sH)
            if not _sJ then
                return
            end
            local _sL, _sM = 0, _fJ(_sK) * 3 + 6
            while _F.Running and _e() do
                _sJ, _sK = _ra(_sG, _sH)
                if not _sJ then
                    return
                end
                local _sN = _gh(_sG, _sH, _F.IncludeBg)
                if _sN == nil then
                    _kv(_F.Skip, _sI, 60)
                    return
                end
                if _sN == "broke" then
                    _F.Broken += 1
                    _F.Status = "Pecah " .. _dM(_sK) .. " (" .. _sG .. "," .. _sH .. ")"
                    _kq[_sI] = (_kq[_sI] or 0) + 1
                    if _kq[_sI] > 6 then
                        _kv(_F.Skip, _sI, 120)
                        return
                    end
                    _sL = 0
                    local _sO, _sP = _ra(_sG, _sH)
                    if _sP then
                        _sM = _fJ(_sP) * 3 + 6
                    end
                else
                    _sL += 1
                    _F.Status = "Pukul " .. _dM(_sK) .. " (" .. _sG .. "," .. _sH .. ")"
                    if _sL > _sM then
                        _kv(_F.Skip, _sI, 45)
                        return
                    end
                end
                if not _oZ(_D.BreakMs) then
                    return
                end
                if _sN == "broke" then
                    local _sQ = _kS()
                    if not _sQ or not _sQ.grounded then
                        return
                    end
                end
            end
        end
        local function _sR(_sS, _sT)
            local _sU = _kk(_sT.y - 0.475)
            local _sV = _kQ() - 0.08
            local _sW = 0
            for _sX, _sY in ipairs(_sS) do
                if not _F.Running or not _e() then
                    break
                end
                local _sZ = _kS()
                if not _sZ or _sZ.dead or not _lE(_sZ, _sY.x, _sY.y, _sV) then
                    break
                end
                if not _sZ.grounded or _kk(_sZ.y - 0.475) ~= _sU then
                    break
                end
                local _ta = false
                if _sY.support then
                    local _tb = _sv(_sZ, _sY.x, _kk(_sZ.y + 0.01))
                    if _tb == nil then
                        _ta = true
                        _F.Status = ("Lewati (%d,%d): di bawahnya berbahaya"):format(_sY.x, _sY.y)
                    elseif _tb > 3 then
                        _ta = true
                        _F.Status = ("Lewati pijakan (%d,%d): di bawahnya jurang"):format(_sY.x, _sY.y)
                    end
                end
                if _ta then
                    _kv(_F.Skip, _sY.idx, 20)
                else
                    _sE(_sY)
                    _sW += 1
                end
            end
            return _sW
        end
        local _tc = nil
        local function _td()
            if not _S.ClearStatus then
                return
            end
            local _te = "Status   : " .. (_F.Running and "JALAN" or "BERHENTI") .. "\nBaris    : " .. (_F.TopRow >= 0 and (_F.TopRow .. "-" .. (_F.TopRow + 1)) or "-") .. "  | arah: " .. ((_F.Dir == -1 and _F.Sweep == "Zig-zag") and "kanan→kiri" or "kiri→kanan") .. "\nDipecah  : " .. _F.Broken .. "  | collect: " .. _D.Collected .. "\nSisa     : " .. (_F.Remaining >= 0 and tostring(_F.Remaining) or "-") .. "  | dilewati: " .. _kE(_F.Skip) .. "\nPijakan  : " .. _qR(_F.UseBlock, _F.ScaffoldId) .. "  | dipasang: " .. _km.Placed .. "\nAksi     : " .. _F.Status
            if _te == _tc then
                return
            end
            _tc = _te
            task.defer(function()
                pcall(function()
                    _S.ClearStatus:SetDesc(_te)
                end)
            end)
        end
        local function _tf()
            local _tg, _th, _ti = 0, 0, -10
            while _F.Running and _e() do
                task.wait()
                local _tj = os.clock()
                if _tj - _ti > 3 then
                    _ti = _tj
                    _F.Remaining = _rs()
                    if not _F.Running or not _e() then
                        break
                    end
                end
                if _tj - _th > 0.5 then
                    _th = _tj
                    _td()
                end
                local _tk = _P.World
                local _tl = _kS()
                if not _tk or not _tl or _tl.dead then
                    _oX()
                    _F.Status = "Menunggu karakter / world..."
                    task.wait(0.5)
                    continue
                end
                if not _tl.grounded then
                    _oX()
                    continue
                end
                _oX()
                local _tm = _rh()
                if not _tm then
                    local _tn = _rs()
                    _F.Remaining = _tn
                    if _tn == 0 then
                        _kf("World sudah bersih!")
                        return
                    end
                    _tg += 1
                    if _tg >= 3 then
                        _kf(("Selesai. Sisa %d tile tidak bisa dijangkau / dipecah"):format(_tn))
                        return
                    end
                    _F.Status = ("Sisa %d tile dilewati, coba ulang (%d/3)..."):format(_tn, _tg)
                    _td()
                    table.clear(_F.Skip)
                    table.clear(_ko)
                    table.clear(_kn)
                    _kr = nil
                    if not _oZ(2000) then
                        break
                    end
                    continue
                end
                _F.TopRow = _tm
                local _to = _tm + 1
                local _tp = _rE(_tm, _tl)
                local _tq = _sc(_tl, _to, _tp)
                if #_tq > 0 then
                    if _sR(_tq, _tl) > 0 then
                        _tg = 0
                    end
                    continue
                end
                local _tr = _kQ() - 0.35
                local _ts = _lP() ~= nil
                local _tt, _tu = _me(_tl)
                local _tv = _rO(_tm, _to, _tp, _oN(_tu * _tk.w + _tt, _tr, _ts))
                if #_tv > 0 then
                    local _tw = {}
                    for _tx, _ty in ipairs(_tv) do
                        if (_ty.x - _tv[1].x) * _tp <= 4 then
                            _tw[#_tw + 1] = _ty
                        end
                    end
                    _qt(_tt, _tu, _tw, _tr, _ts, _F.Skip, _ko)
                end
            end
            _oX()
        end
        local function _tz()
            if _S.ClearToggle then
                pcall(function()
                    _S.ClearToggle:Set(_F.Running)
                end)
            end
        end
        _kf = function(_tA)
            _F.Running = false
            _qQ()
            _tz()
            _F.Status = _tA or "Dihentikan"
            if _tA then
                _bH("Auto Clear", _tA, 5)
                if not string.find(_tA, "^Dihentikan") then
                    _cz.send("stop", "Auto Clear berhenti: " .. _tA)
                end
            end
            _td()
        end
        local function _tB()
            if not _P.World then
                return "Data world belum ketemu. Tekan 'Hubungkan ke game'"
            end
            if not _P.Punch then
                return "Fungsi pukul game belum ketemu. Tekan 'Hubungkan ke game'"
            end
            if not _iM then
                return "Kontrol gerak game (WorldMenu.isDown) tidak ketemu"
            end
            if not _kS() then
                return "Kamu belum masuk world"
            end
            return nil
        end
        local function _tC()
            if _F.Running then
                return
            end
            local _tD = _tB()
            if _tD then
                _bH("Auto Clear", _tD, 4)
                _tz()
                return
            end
            if _F.UseBlock and (not _F.ScaffoldId or _dP(_F.ScaffoldId) <= 0) then
                _bH("Auto Clear", "Block pijakan belum dipilih / habis: jalan tanpa block pijakan", 5)
            end
            if _H.Running and _H.stop then
                _H.stop("Dihentikan karena Auto Clear dimulai")
            end
            if _K.Running and _K.stop then
                _K.stop("Dihentikan karena Auto Clear dimulai")
            end
            if _J.Running and _J.stop then
                _J.stop("Dihentikan karena Auto Clear dimulai")
            end
            if _D.Running then
                _iR("Dihentikan karena Auto Clear dimulai")
            end
            if _M.Running then
                _kg("Dihentikan karena Auto Clear dimulai")
            end
            table.clear(_F.Skip)
            table.clear(_ko)
            table.clear(_kn)
            table.clear(_kq)
            _F.Broken = 0
            _F.Remaining = -1
            _F.TopRow = -1
            _F.DirRow, _F.Dir = nil, nil
            _F.Status = "Mulai..."
            _F.Running = true
            _qP()
            _tz()
            _td()
            task.spawn(function()
                local _tE, _tF = pcall(_tf)
                if not _tE then
                    warn("[Noxablox] Auto Clear error: " .. tostring(_tF))
                    if _F.Running then
                        _kf("Error: " .. tostring(_tF))
                    end
                end
            end)
        end
        local function _tG()
            _P.Trees = nil
            local _tH = _n:FindFirstChild("TreeChanged")
            if not (_tH and getconnections) then
                return false
            end
            local _tI, _tJ = pcall(getconnections, _tH.OnClientEvent)
            if not _tI or type(_tJ) ~= "table" then
                return false
            end
            for _tK, _tL in ipairs(_tJ) do
                local _tM, _tN = pcall(function()
                    return _tL.Function
                end)
                if _tM and type(_tN) == "function" then
                    local _tO = _gx(_tN)
                    local _tP = {}
                    for _tQ = 1, 12 do
                        local _tR = _tO[_tQ]
                        if type(_tR) == "table" and _tR ~= _P.World and rawget(_tR, "fg") == nil then
                            _tP[#_tP + 1] = _tR
                        end
                    end
                    for _tS, _tT in ipairs(_tP) do
                        local _tU, _tV = next(_tT)
                        if type(_tV) == "table" and type(rawget(_tV, "p")) == "number" then
                            _P.Trees = _tT
                            break
                        end
                    end
                    if not _P.Trees then
                        for _tW, _tX in ipairs(_tP) do
                            if next(_tX) == nil then
                                _P.Trees = _tX
                                break
                            end
                        end
                    end
                end
                if _P.Trees then
                    break
                end
            end
            return _P.Trees ~= nil
        end
        local function _tY()
            return math.min(_kQ(), _kR())
        end
        local function _tZ()
            return _M.SeedId and _dP(_M.SeedId) or 0
        end
        local function _ua(_ub, _uc, _ud)
            local _ue, _uf = _P.Trees, _P.World
            if not _ue or not _uf then
                return nil
            end
            local _ug = _p[_ud]
            if not (_ug and _ug.kind == "seed") then
                return nil
            end
            local _uh = _ue[_uc * _uf.w + _ub]
            if type(_uh) ~= "table" or type(_uh.p) ~= "number" then
                return nil
            end
            return _uh.p + (_ug.grow or 0)
        end
        local function _ui(_uj, _uk, _ul)
            local _um = _P.World
            if not _um or _uj < 0 or _uk < 0 or _uj >= _um.w or _uk + 1 >= _um.h then
                return false
            end
            if _kV(_uj, _uk) ~= 0 then
                return false
            end
            local _un = _kV(_uj, _uk + 1)
            if _un == 0 then
                return false
            end
            local _uo = _p[_un]
            if not _uo or _uo.kind == "seed" then
                return false
            end
            if not (_le(_uj, _uk + 1) or _uo.platform) then
                return false
            end
            local _ur, _us = pcall(function()
                if _um.areas and type(_um.areas.canEdit) == "function" and not _um.areas.canEdit(_uj, _uk) then
                    return false
                end
                if type(_um.builderOk) == "function" and not _um.builderOk(_uj, _uk, true) then
                    return false
                end
                local _up = _ul or _M.SeedId
                local _uq = _up and _p[_up]
                if _uq and type(_um.needsWay) == "function" and _um.needsWay(_uq) and type(_um.wayBlocked) == "function" and _um.wayBlocked(_uj, _uk) then
                    return false
                end
                return true
            end)
            return (not _ur) or _us
        end
        local _ut = nil
        local function _uu()
            return {
                run = function()
                    return _M.Running
                end,
                harvest = _M.Harvest,
                plant = _M.Plant,
                seed = _M.SeedId,
                skip = _M.Skip,
                hms = _M.HarvestMs,
                pms = _M.PlantMs,
                area = nil,
                plantSet = nil,
                exclude = nil,
                status = function(_uv)
                    _M.Status = _uv
                end,
                onHarvest = function()
                    _M.Harvested += 1
                end,
                onPlant = function()
                    _M.Planted += 1
                end,
            }
        end
        local function _uw()
            return _ut.seed and _dP(_ut.seed) or 0
        end
        local function _ux(_uy, _uz)
            return _ut.harvest and (not _ut.area or _ut.area(_uy, _uz))
        end
        local function _uA(_uB)
            return (not _ut.plantSet or _ut.plantSet[_uB]) and not (_ut.exclude and _ut.exclude[_uB])
        end
        local function _uC(_uD, _uE)
            local _uF = _ut.seed
            if not _uF or _dP(_uF) <= 0 then
                return false
            end
            _fx("fg", _uD, _uE, _uF)
            if _P.Inv then
                pcall(function()
                    _P.Inv:remove(_uF, 1)
                end)
            end
            _ut.onPlant()
            _ut.status("Tanam " .. _dM(_uF) .. " (" .. _uD .. "," .. _uE .. ")")
            return true
        end
        local function _uG(_uH)
            local _uI = _P.World
            local _uJ = _uI.w
            local _uK = _tY() - 0.08
            local _uL, _uM = _uH.x, _uH.y - 0.475
            local _uN = os.clock()
            local _uO = workspace:GetServerTimeNow()
            local _uP = _ut.plant and _uw() > 0
            local _uQ, _uR = {}, {}
            for _uS = math.max(0, _kk(_uM - _uK - 0.5)), math.min(_kk(_uM + _uK + 0.5), _uI.h - 1) do
                for _uT = math.max(0, _kk(_uL - _uK - 0.5)), math.min(_kk(_uL + _uK + 0.5), _uJ - 1) do
                    if _lE(_uH, _uT, _uS, _uK) then
                        local _uU = _uS * _uJ + _uT
                        if not _kz(_ut.skip, _uU, _uN) then
                            local _uV = _kV(_uT, _uS)
                            if _uV ~= 0 and _ux(_uT, _uS) then
                                local _uW = _ua(_uT, _uS, _uV)
                                if _uW and _uO >= _uW then
                                    if _lJ(_uT, _uS) then
                                        _uQ[#_uQ + 1] = {x = _uT, y = _uS, idx = _uU}
                                    else
                                        _kv(_ut.skip, _uU, 120)
                                    end
                                end
                            elseif _uP and _uV == 0 and _uA(_uU) and _ui(_uT, _uS, _ut.seed) then
                                _uR[#_uR + 1] = {x = _uT, y = _uS, idx = _uU}
                            end
                        end
                    end
                end
            end
            local function _uX(_uY, _uZ)
                if _uY.x ~= _uZ.x then
                    return _uY.x < _uZ.x
                end
                return _uY.y < _uZ.y
            end
            table.sort(_uQ, _uX)
            table.sort(_uR, _uX)
            local _va = 0
            for _vb, _vc in ipairs(_uQ) do
                if not _ut.run() or not _e() then
                    return _va
                end
                local _vd = _kS()
                if not _vd or not _lE(_vd, _vc.x, _vc.y, _uK) then
                    return _va
                end
                local _ve = _kV(_vc.x, _vc.y)
                local _vf = _gh(_vc.x, _vc.y, false)
                if _vf == "broke" then
                    _ut.onHarvest()
                    _ut.status("Panen " .. _dM(_ve) .. " (" .. _vc.x .. "," .. _vc.y .. ")")
                else
                    _kv(_ut.skip, _vc.idx, 30)
                end
                _va += 1
                if not _oZ(_ut.hms) then
                    return _va
                end
            end
            for _vg, _vh in ipairs(_uR) do
                if not _ut.run() or not _e() then
                    return _va
                end
                if _uw() <= 0 then
                    break
                end
                local _vi = _kS()
                if not _vi or not _lE(_vi, _vh.x, _vh.y, _uK) then
                    return _va
                end
                if _kV(_vh.x, _vh.y) == 0 then
                    if not _uC(_vh.x, _vh.y) then
                        break
                    end
                    _va += 1
                    if not _oZ(_ut.pms) then
                        return _va
                    end
                end
            end
            return _va
        end
        local function _vj(_vk, _vl, _vm, _vn)
            local _vo = _P.World
            local _vp, _vq = _vo.w, _vo.h
            local _vr = {}
            local _vs = os.clock()
            local _vt = workspace:GetServerTimeNow()
            local _vu = nil
            local _vv = _ut.plant and _uw() > 0
            local _vw = 0
            for _vx = 0, _vq - 1 do
                local _vy, _vz = _vo.fg[_vx], _vo.fg[_vx + 1]
                for _vA = 0, _vp - 1 do
                    local _vB = _vy and _vy[_vA] or 0
                    local _vC = nil
                    if _vB ~= 0 then
                        if _ux(_vA, _vx) then
                            local _vD = _ua(_vA, _vx, _vB)
                            if _vD then
                                if _vt >= _vD then
                                    _vC = "harvest"
                                elseif not _vu or _vD - _vt < _vu then
                                    _vu = _vD - _vt
                                end
                            end
                        end
                    elseif _vv then
                        local _vE = _vz and _vz[_vA] or 0
                        if _vE ~= 0 and _uA(_vx * _vp + _vA) then
                            _vC = "plant"
                        end
                    end
                    if _vC then
                        local _vF = _vx * _vp + _vA
                        if not _kz(_ut.skip, _vF, _vs) then
                            if _vn and not _vn[_vF] then
                                _kv(_ut.skip, _vF, 60)
                            else
                                local _vG, _vH = _vA - _vk, (_vx - _vl) * 1.3
                                local _vI = _vG * _vG + _vH * _vH - ((_vC == "harvest") and 4 or 0)
                                if #_vr < _vm or _vI < _vr[#_vr].d then
                                    local _vJ
                                    if _vC == "harvest" then
                                        _vJ = _lJ(_vA, _vx)
                                    else
                                        _vJ = _ui(_vA, _vx, _ut.seed)
                                    end
                                    if _vJ then
                                        local _vK = #_vr + 1
                                        while _vK > 1 and _vr[_vK - 1].d > _vI do
                                            _vK -= 1
                                        end
                                        table.insert(_vr, _vK, {x = _vA, y = _vx, idx = _vF, d = _vI, kind = _vC})
                                        if #_vr > _vm then
                                            _vr[#_vr] = nil
                                        end
                                    else
                                        _kv(_ut.skip, _vF, 120)
                                    end
                                end
                            end
                        end
                    end
                end
                _vw += _vp
                if _vw >= 6000 then
                    _vw = 0
                    task.wait()
                    if not _ut.run() or not _e() then
                        break
                    end
                end
            end
            return _vr, _vu
        end
        local _vL = nil
        local function _vM()
            if not _S.FarmerStatus then
                return
            end
            local _vN = _M.SeedId
            local _vO = "Status  : " .. (_M.Running and "JALAN" or "BERHENTI") .. "\nPanen   : " .. _M.Harvested .. "  | tanam: " .. _M.Planted .. "  | collect: " .. _D.Collected .. "\nSeed    : " .. (_vN and (_dM(_vN) .. " x" .. _dP(_vN)) or "-") .. "\nPohon   : " .. (_P.Trees and "terbaca" or "TIDAK terbaca (harvest mati)") .. "\nPijakan : " .. _qR(_M.UseBlock, _M.ScaffoldId) .. "\nAksi    : " .. _M.Status
            if _vO == _vL then
                return
            end
            _vL = _vO
            task.defer(function()
                pcall(function()
                    _S.FarmerStatus:SetDesc(_vO)
                end)
            end)
        end
        local function _vP()
            local _vQ = _P.World
            local _vR = _kS()
            if not _vQ or not _vR or _vR.dead then
                _oX()
                task.wait(0.5)
                return "wait"
            end
            if not _vR.grounded then
                _oX()
                task.wait()
                return "wait"
            end
            _oX()
            if _uG(_vR) > 0 then
                return "work"
            end
            local _vS = _tY() - 0.35
            local _vT = _lP() ~= nil
            local _vU, _vV = _me(_vR)
            local _vW, _vX = _kk(_vR.x), _kk(_vR.y - 0.475)
            local _vY, _vZ = _vj(_vW, _vX, 8, _oN(_vV * _vQ.w + _vU, _vS, _vT))
            if not _ut.run() or not _e() then
                return "wait"
            end
            if #_vY == 0 then
                return "idle", _vZ
            end
            _qt(_vU, _vV, _vY, _vS, _vT, _ut.skip, _kp)
            return "move"
        end
        local function _wa()
            local _wb = 0
            while _M.Running and _e() do
                task.wait()
                if os.clock() - _wb > 0.5 then
                    _wb = os.clock()
                    _vM()
                end
                _ut = _uu()
                if not _P.World then
                    _M.Status = "Menunggu karakter / world..."
                    task.wait(0.5)
                    continue
                end
                local _wc, _wd = _vP()
                if _wc == "wait" and not _kS() then
                    _M.Status = "Menunggu karakter / world..."
                end
                if _wc == "idle" then
                    local _we = {}
                    if _M.Harvest then
                        _we[#_we + 1] = _wd and ("pohon siap ±" .. math.ceil(_wd) .. " dtk") or "tidak ada pohon"
                    end
                    if _M.Plant then
                        _we[#_we + 1] = (_tZ() <= 0) and "seed habis / belum dipilih" or "tidak ada tempat tanam"
                    end
                    _M.Status = "Menunggu: " .. table.concat(_we, ", ")
                    if not _oZ(1000) then
                        break
                    end
                end
            end
            _oX()
        end
        local function _wf()
            if _S.FarmerToggle then
                pcall(function()
                    _S.FarmerToggle:Set(_M.Running)
                end)
            end
        end
        _kg = function(_wg)
            _M.Running = false
            _qQ()
            _wf()
            _M.Status = _wg or "Dihentikan"
            if _wg then
                _bH("Farmer", _wg, 5)
                if not string.find(_wg, "^Dihentikan") then
                    _cz.send("stop", "Farmer berhenti: " .. _wg)
                end
            end
            _vM()
        end
        local function _wh()
            if _M.Running then
                return
            end
            local _wi = _tB()
            if not _wi and not _M.Harvest and not _M.Plant then
                _wi = "Aktifkan Auto Harvest atau Auto Plant"
            end
            if not _wi and not _M.Harvest and not _M.SeedId then
                _wi = "Pilih seed dulu untuk Auto Plant"
            end
            if _wi then
                _bH("Farmer", _wi, 4)
                _wf()
                return
            end
            if _M.Harvest and not _P.Trees and not _tG() then
                _bH("Farmer", "Data pohon tidak ketemu: Auto Harvest tidak bisa cek pohon siap", 5)
            end
            if _H.Running and _H.stop then
                _H.stop("Dihentikan karena Farmer dimulai")
            end
            if _K.Running and _K.stop then
                _K.stop("Dihentikan karena Farmer dimulai")
            end
            if _J.Running and _J.stop then
                _J.stop("Dihentikan karena Farmer dimulai")
            end
            if _D.Running then
                _iR("Dihentikan karena Farmer dimulai")
            end
            if _F.Running then
                _kf("Dihentikan karena Farmer dimulai")
            end
            table.clear(_M.Skip)
            table.clear(_kp)
            table.clear(_kn)
            _M.Status = "Mulai..."
            _M.Running = true
            _qP()
            _wf()
            _vM()
            task.spawn(function()
                local _wj, _wk = pcall(_wa)
                if not _wj then
                    warn("[Noxablox] Farmer error: " .. tostring(_wk))
                    if _M.Running then
                        _kg("Error: " .. tostring(_wk))
                    end
                end
            end)
        end
        local _wl = {}
        local function _wm()
            return _dP(_H.A or 0), _dP(_H.B or 0)
        end
        local function _wn(_wo, _wp, _wq)
            local _wr = _H.A
            local _ws = _kV(_wo, _wp)
            if _ws == 0 then
                local _wt, _wu = _wm()
                if _wt > 0 and _wu > 0 and _ui(_wo, _wp, _wr) then
                    return "plant"
                end
                return nil
            end
            if _ws ~= _wr then
                return nil
            end
            local _wv, _ww = _P.Trees, _P.World
            local _wx = _wv and _wv[_wp * _ww.w + _wo]
            if type(_wx) == "table" and _wx.s == true then
                return nil
            end
            local _wy = _ua(_wo, _wp, _ws)
            if _wy and _wq >= _wy then
                return nil
            end
            local _wz, _wA = _wm()
            if _wA > 0 and _lJ(_wo, _wp) then
                return "splice"
            end
            return nil
        end
        local function _wB(_wC, _wD)
            local _wE = _P.World
            local _wF = _wE and rawget(_wE, "spliceSeed")
            if type(_wF) ~= "function" then
                return false, "fungsi splice game tidak ketemu"
            end
            local _wG, _wH = pcall(_wF, _wC, _wD, _H.B)
            if _wG and _wH and _p[_wH] then
                pcall(function()
                    _P.Inv:remove(_H.B, 1)
                end)
                if _P.SetTile then
                    pcall(_P.SetTile, "fg", _wC, _wD, _wH, true)
                end
                _H.Made += 1
                _H.Status = ("Splice jadi %s (%d,%d)"):format(_dM(_wH), _wC, _wD)
                return true
            end
            return false, "ditolak server"
        end
        local function _wI(_wJ)
            local _wK = _H.A
            if _kV(_wJ.x, _wJ.y) == 0 then
                if _dP(_wK) <= 0 then
                    return false
                end
                _fx("fg", _wJ.x, _wJ.y, _wK)
                pcall(function()
                    _P.Inv:remove(_wK, 1)
                end)
                _H.Planted += 1
                _H.Status = ("Tanam %s (%d,%d)"):format(_dM(_wK), _wJ.x, _wJ.y)
                if not _oZ(_H.Ms) then
                    return false
                end
            end
            if _kV(_wJ.x, _wJ.y) ~= _wK then
                _kv(_H.Skip, _wJ.idx, 30)
                return true
            end
            local _wL, _wM = _wB(_wJ.x, _wJ.y)
            if not _wL then
                _wl[_wJ.idx] = (_wl[_wJ.idx] or 0) + 1
                _kv(_H.Skip, _wJ.idx, 60)
                _H.Status = ("Gagal splice (%d,%d): %s"):format(_wJ.x, _wJ.y, tostring(_wM))
            end
            _oZ(_H.Ms)
            return true
        end
        local function _wN(_wO)
            local _wP = _P.World
            local _wQ = _wP.w
            local _wR = _tY() - 0.08
            local _wS, _wT = _wO.x, _wO.y - 0.475
            local _wU = os.clock()
            local _wV = workspace:GetServerTimeNow()
            local _wW = {}
            for _wX = math.max(0, _kk(_wT - _wR - 0.5)), math.min(_kk(_wT + _wR + 0.5), _wP.h - 1) do
                for _wY = math.max(0, _kk(_wS - _wR - 0.5)), math.min(_kk(_wS + _wR + 0.5), _wQ - 1) do
                    if _lE(_wO, _wY, _wX, _wR) then
                        local _wZ = _wX * _wQ + _wY
                        if not _kz(_H.Skip, _wZ, _wU) and _wn(_wY, _wX, _wV) then
                            _wW[#_wW + 1] = {x = _wY, y = _wX, idx = _wZ}
                        end
                    end
                end
            end
            table.sort(_wW, function(_xa, _xb)
                if _xa.x ~= _xb.x then
                    return _xa.x < _xb.x
                end
                return _xa.y < _xb.y
            end)
            local _xc = 0
            for _xd, _xe in ipairs(_wW) do
                if not _H.Roaming or not _e() then
                    return _xc
                end
                local _xf = _kS()
                if not _xf or not _lE(_xf, _xe.x, _xe.y, _wR) then
                    return _xc
                end
                if not _wI(_xe) then
                    return _xc
                end
                _xc += 1
            end
            return _xc
        end
        local function _xg(_xh, _xi, _xj, _xk)
            local _xl = _P.World
            local _xm, _xn = _xl.w, _xl.h
            local _xo = {}
            local _xp = os.clock()
            local _xq = workspace:GetServerTimeNow()
            local _xr = 0
            for _xs = 0, _xn - 1 do
                for _xt = 0, _xm - 1 do
                    local _xu = _xs * _xm + _xt
                    if not _kz(_H.Skip, _xu, _xp) then
                        local _xv, _xw = _xt - _xh, (_xs - _xi) * 1.3
                        local _xx = _xv * _xv + _xw * _xw
                        if (#_xo < _xj or _xx < _xo[#_xo].d) and _wn(_xt, _xs, _xq) then
                            if _xk and not _xk[_xu] then
                                _kv(_H.Skip, _xu, 60)
                            else
                                local _xy = #_xo + 1
                                while _xy > 1 and _xo[_xy - 1].d > _xx do
                                    _xy -= 1
                                end
                                table.insert(_xo, _xy, {x = _xt, y = _xs, idx = _xu, d = _xx})
                                if #_xo > _xj then
                                    _xo[#_xo] = nil
                                end
                            end
                        end
                    end
                end
                _xr += _xm
                if _xr > 6000 then
                    _xr = 0
                    task.wait()
                    if not _H.Roaming then
                        return _xo
                    end
                end
            end
            return _xo
        end
        local function _xz(_xA)
            while _H.Roaming and _H.Running and _e() and _H.RunId == _xA do
                task.wait()
                local _xB = _P.World
                local _xC = _kS()
                if not _xB or not _xC or _xC.dead then
                    _oX()
                    _H.Status = "Menunggu karakter / world..."
                    task.wait(0.5)
                    continue
                end
                if not _xC.grounded then
                    _oX()
                    continue
                end
                _oX()
                local _xD, _xE = _wm()
                if _xE <= 0 then
                    if _H.stop then
                        _H.stop("Seed habis")
                    end
                    break
                end
                if _wN(_xC) > 0 then
                    continue
                end
                local _xF = _tY() - 0.35
                local _xG, _xH = _me(_xC)
                local _xI, _xJ = _kk(_xC.x), _kk(_xC.y - 0.475)
                local _xK = _xg(_xI, _xJ, 8, _oN(_xH * _xB.w + _xG, _xF, false))
                if not _H.Roaming or not _e() then
                    break
                end
                if #_xK == 0 then
                    _H.Status = (_xD <= 0) and "Seed A habis, tidak ada pohon A yang bisa di-splice" or "Menunggu: tidak ada tempat tanam / pohon untuk di-splice"
                    if not _oZ(1000) then
                        break
                    end
                    continue
                end
                _qt(_xG, _xH, _xK, _xF, false, _H.Skip, _wl)
            end
            _oX()
        end
        local function _xL()
            if not _iM then
                return "Kontrol gerak game (WorldMenu.isDown) tidak ketemu"
            end
            if not _kS() then
                return "Kamu belum masuk world"
            end
            if not _P.Trees then
                _tG()
            end
            table.clear(_H.Skip)
            table.clear(_wl)
            table.clear(_kn)
            _H.Roaming = true
            _qP()
            local _xM = _H.RunId
            task.spawn(function()
                local _xN, _xO = pcall(_xz, _xM)
                if not _xN then
                    warn("[Noxablox] Splice error: " .. tostring(_xO))
                    if _H.Running and _H.stop then
                        _H.stop("Error: " .. tostring(_xO))
                    end
                end
            end)
            return nil
        end
        local function _xP()
            _H.Roaming = false
            _qQ()
            _oX()
        end
        local function _xQ(_xR, _xS, _xT)
            local _xU = _P.World
            if not _xU or not _iM then
                return false
            end
            if _xR < 0 or _xS < 0 or _xR >= _xU.w or _xS >= _xU.h then
                return false
            end
            _km.Homing = true
            _qP()
            local _xV = {[_xS * _xU.w + _xR] = true}
            local _xW, _xX = os.clock(), false
            while _e() and _km.Homing and os.clock() - _xW < (_xT or 30) do
                local _xY = _kS()
                if not _xY or _xY.dead then
                    task.wait(0.3)
                else
                    local _xZ, _ya = _me(_xY)
                    if _xZ == _xR and _ya == _xS and _xY.grounded then
                        _xX = true
                        break
                    end
                    local _yb = _mH(_xZ, _ya, _xV, _xR, _xS, 0.5, false)
                    if not _yb then
                        break
                    end
                    if #_yb > 0 then
                        _qi(_yb)
                    end
                    _oX()
                    task.wait(0.15)
                end
            end
            _km.Homing = false
            _qQ()
            return _xX
        end
        local function _yc()
            local _yd = _P.World
            local _ye = {}
            if not _yd then
                return _ye
            end
            local _yf = math.clamp(math.floor(_I.Gap), 2, 3)
            for _yg = 0, math.max(0, math.floor(_I.Rows)) - 1 do
                local _yh = math.floor(_I.Y0) + _yg * _yf
                if _yh < 1 or _yh >= _yd.h - 1 then
                    break
                end
                _ye[#_ye + 1] = _yh
            end
            return _ye
        end
        local function _yi(_yj)
            local _yk = _P.World
            local _yl = math.clamp(math.floor(_I.X0), 0, _yk.w - 1)
            local _ym = math.clamp(math.floor(_I.X1), 0, _yk.w - 1)
            if _ym < _yl then
                _yl, _ym = _ym, _yl
            end
            if _I.Stairs and _ym - _yl >= 3 then
                if _yj % 2 == 0 then
                    _ym -= 1
                else
                    _yl += 1
                end
            end
            return _yl, _ym
        end
        local function _yn(_yo, _yp)
            local _yq = _yc()
            if #_yq == 0 then
                return false
            end
            local _yr = math.min(_I.X0, _I.X1)
            local _ys = math.max(_I.X0, _I.X1)
            return _yo >= _yr and _yo <= _ys and _yp >= _yq[1] - 1 and _yp <= _yq[#_yq]
        end
        local function _yt()
            local _yu = {}
            local _yv = _P.World
            if not _yv then
                return _yu
            end
            for _yw, _yx in ipairs(_yc()) do
                local _yy, _yz = _yi(_yw - 1)
                for _yA = _yy, _yz do
                    _yu[_yx * _yv.w + _yA] = true
                end
            end
            return _yu
        end
        local function _yB()
            local _yC = {}
            local _yD = _P.World
            if not _yD then
                return _yC
            end
            for _yE, _yF in ipairs(_yc()) do
                local _yG, _yH = _yi(_yE - 1)
                for _yI = _yG, _yH do
                    if _kV(_yI, _yF) ~= 0 and _yF - 1 >= 0 then
                        _yC[(_yF - 1) * _yD.w + _yI] = true
                    end
                end
            end
            return _yC
        end
        local function _yJ(_yK)
            local _yL = {rows = 0, total = 0, need = 0, done = 0, blocked = 0, gap = 0}
            local _yM = _P.World
            if not _yM then
                return _yL
            end
            local _yN = _yc()
            _yL.rows = #_yN
            for _yO, _yP in ipairs(_yN) do
                local _yQ, _yR = _yi(_yO - 1)
                for _yS = _yQ, _yR do
                    _yL.total += 1
                    local _yT = _kV(_yS, _yP)
                    local _yU = _p[_yT]
                    if _yT == 0 then
                        _yL.need += 1
                    elseif _yT == _yK or (_yU and _yU.solid and _yU.kind ~= "seed") then
                        _yL.done += 1
                    else
                        _yL.blocked += 1
                    end
                    local _yV = _kV(_yS, _yP - 1)
                    local _yW = _p[_yV]
                    if _yV ~= 0 and not (_yW and _yW.kind == "seed") then
                        _yL.gap += 1
                    end
                end
            end
            return _yL
        end
        local function _yX(_yY)
            local _yZ = _yY and _p[_yY]
            if not _yZ then
                return nil
            end
            local _za = _yZ.seedId or (_yY + 1)
            local _zb = _p[_za]
            if _zb and _zb.kind == "seed" then
                return _za
            end
            return nil
        end
        local function _zc(_zd)
            if not _zd then
                return nil
            end
            local _ze = _zd - 1
            local _zf = _p[_ze]
            if _zf and _zf.kind ~= "seed" and (_zf.seedId == nil or _zf.seedId == _zd) then
                return _ze
            end
            return nil
        end
        local _rotationFarmSet
        local function _zg(_zh)
            local _zi = _P.World
            if not _zi then
                return 0
            end
            local _zj = workspace:GetServerTimeNow()
            if not _zh and next(_K.FarmTiles) ~= nil then
                local _selected = _rotationFarmSet and _rotationFarmSet() or {}
                if next(_selected) ~= nil then
                    local _ready, _soon = 0, nil
                    for _index in pairs(_selected) do
                        local _x = _index % _zi.w
                        local _y = math.floor(_index / _zi.w)
                        local _tile = _kV(_x, _y)
                        if _tile ~= 0 then
                            local _readyAt = _ua(_x, _y, _tile)
                            if _readyAt then
                                if _zj >= _readyAt then
                                    _ready += 1
                                elseif not _soon or _readyAt - _zj < _soon then
                                    _soon = _readyAt - _zj
                                end
                            end
                        end
                    end
                    return _ready, _soon
                end
            end
            local _zk, _zl, _zm, _zn = 0, _zi.w - 1, 0, _zi.h - 1
            if not _zh then
                local _zo = _yc()
                if #_zo == 0 then
                    return 0
                end
                _zk = math.max(0, math.min(_I.X0, _I.X1))
                _zl = math.min(_zi.w - 1, math.max(_I.X0, _I.X1))
                _zm, _zn = math.max(0, _zo[1] - 1), _zo[#_zo]
            end
            local _zp, _zq = 0, nil
            for _zr = _zm, _zn do
                for _zs = _zk, _zl do
                    local _zt = _kV(_zs, _zr)
                    if _zt ~= 0 then
                        local _zu = _ua(_zs, _zr, _zt)
                        if _zu then
                            if _zj >= _zu then
                                _zp += 1
                            elseif not _zq or _zu - _zj < _zq then
                                _zq = _zu - _zj
                            end
                        end
                    end
                end
            end
            return _zp, _zq
        end
        local _zv = 10
        local _zw = 190
        _rotationFarmSet = function()
            local _world = _P.World
            local _set = {}
            if not _world or _K.FarmAnchorX < 0 or _K.FarmAnchorY < 0 then
                return _set
            end
            for _key in pairs(_K.FarmTiles) do
                local _dx, _dy = string.match(tostring(_key), "^(-?%d+),(-?%d+)$")
                _dx, _dy = tonumber(_dx), tonumber(_dy)
                if _dx and _dy then
                    local _x, _y = _K.FarmAnchorX + _dx, _K.FarmAnchorY + _dy
                    if _x >= 0 and _y >= 0 and _x < _world.w and _y < _world.h then
                        _set[_y * _world.w + _x] = true
                    end
                end
            end
            return _set
        end
        local function _rotationFarmContains(_x, _y, _set)
            local _world = _P.World
            if not _world then return false end
            _set = _set or _rotationFarmSet()
            return _set[_y * _world.w + _x] == true
        end
        local function _zx(_zy, _zz, _zA)
            local _zB, _zC = nil, nil
            if not _zy.whole then
                local _customFarm = _rotationFarmSet()
                if next(_customFarm) ~= nil then
                    _zB = _customFarm
                    _zC = function(_x, _y)
                        return _rotationFarmContains(_x, _y, _customFarm)
                    end
                else
                    _zB = _yB()
                    _zC = _yn
                end
            end
            return {
                run = _zy.live,
                harvest = _zz,
                plant = _zA and _dP(_zy.seed) > 0,
                seed = _zy.seed,
                skip = _K.Skip,
                hms = _M.HarvestMs,
                pms = _M.PlantMs,
                area = _zC,
                plantSet = _zB,
                exclude = _zy.exclude,
                status = function(_zD)
                    _K.Status = _zD
                end,
                onHarvest = function()
                    _K.Harvested += 1
                end,
                onPlant = function()
                    _K.Planted += 1
                end,
            }
        end
        local function _zE(_zF)
            if os.clock() < (_K.BreakFailUntil or 0) then
                return false
            end
            local _zG = _kS()
            if not _zG then
                return false
            end
            local _zH, _zI = _me(_zG)
            if _zH ~= _K.BreakX or _zI ~= _K.BreakY then
                _K.Status = ("Jalan ke posisi break (%d,%d)"):format(_K.BreakX, _K.BreakY)
                if not _xQ(_K.BreakX, _K.BreakY, 45) then
                    _K.Status = "Gagal jalan ke posisi break, dicoba lagi nanti"
                    _K.BreakFailUntil = os.clock() + 30
                    return false
                end
            end
            if not _zF.live() then
                return false
            end
            _D.Override = {offsets = _K.Tiles, block = _zF.block, mode = "Place + Break"}
            _D.Quiet = true
            table.clear(_U)
            table.clear(_V)
            _D.Running = true
            _D.RunId = (_D.RunId or 0) + 1
            local _zJ = _D.RunId
            local _zK = os.clock()
            task.spawn(function()
                while _D.Running and _D.RunId == _zJ do
                    task.wait(1)
                    local _zL = _dP(_zF.seed)
                    if not _zF.live() or os.clock() - _zK > _K.BreakSec or _zL > math.max(1, math.floor(_K.SeedThreshold or _zw)) or (_zF.drop and _K.Drop and _zL >= _K.DropAt) or (_zF.breakMode ~= "always" and _zL >= _zv) then
                        _D.Running = false
                    end
                end
            end)
            _K.Status = "Break " .. _dM(_zF.block) .. " di posisi pabrik"
            local _zM, _zN = pcall(_ju, _zJ)
            if not _zM then
                warn("[Noxablox] Auto Rotasi break error: " .. tostring(_zN))
            end
            _D.Running = false
            _D.Override = nil
            _D.Quiet = false
            return true
        end
        local function _zO()
            local _zP = tostring(_K.DropWorld or ""):gsub("%s", "")
            local _zQ, _zR = string.match(_zP, "^([^:]*):(.+)$")
            if not _zQ then
                _zQ = _zP
            end
            _zQ = string.upper(_zQ):gsub("[^A-Z0-9]", "")
            if _zR == "" then
                _zR = nil
            end
            return _zQ, _zR
        end
        local function _zS(_zT, _zU)
            if _L.worldName() ~= "" then
                _L.leaveWorld()
                task.wait(2)
            end
            if _zU and _P.World then
                rawset(_P.World, "arriveDoor", _zU)
            end
            local _zV, _zW = _L.enterWorld(_zT)
            if _zV then
                task.wait(1.5)
                _L.afterEnter()
            end
            return _zV, _zW
        end
        local function _zX(_zY, _zZ, _Aa)
            local _Ab = _P.Hud
            local _Ac = _Ab and rawget(_Ab, "onDrop")
            if type(_Ac) ~= "function" then
                return 0, "fungsi drop game tidak ketemu"
            end
            local _Ad, _Ae = _zZ, false
            while _Ad > 0 and _Aa() do
                local _Af = _dP(_zY)
                pcall(_Ac, _zY, math.min(_Ad, 200))
                task.wait(0.7)
                local _Ag = _Af - _dP(_zY)
                if _Ag > 0 then
                    _Ad -= _Ag
                    _K.Dropped += _Ag
                elseif not _Ae then
                    _Ae = true
                    local _Ah = _kS()
                    local _Ai = _Ah and (_Ah.facing or 1) < 0
                    _N.active = true
                    _N.right, _N.left = _Ai, not _Ai
                    task.wait(0.06)
                    _N.right, _N.left = false, false
                    task.wait(0.3)
                else
                    return _zZ - _Ad, "tidak bisa drop di posisi ini"
                end
            end
            return _zZ - _Ad, nil
        end
        local function _Aj(_Ak, _Al, _Am)
            local _An, _Ao = _zO()
            local _Ap = _L.worldName()
            if _An == "" then
                _An = _Ap
            end
            if _K.DropX < 0 and not _Ao and _An == _Ap then
                _K.Status = "Posisi drop belum diatur (drop dilewati)"
                _K.DropOffUntil = os.clock() + 60
                return
            end
            _K.Traveling = true
            local _Aq = _An ~= _Ap
            local _Ar, _As = true, nil
            if _Aq or _Ao then
                _K.Status = "Pergi ke " .. _An .. (_Ao and (":" .. _Ao) or "") .. " untuk drop"
                local _At, _Au = _zS(_An, _Ao)
                if not _At then
                    _Ar, _As = false, "gagal masuk " .. _An .. " (" .. tostring(_Au) .. ")"
                end
            end
            if _Ar and _Am() and _K.DropX >= 0 then
                _K.Status = ("Jalan ke posisi drop (%d,%d)"):format(_K.DropX, _K.DropY)
                if not _xQ(_K.DropX, _K.DropY, 60) then
                    _Ar, _As = false, "tidak bisa jalan ke posisi drop"
                end
            end
            if _Ar and _Am() then
                local _Av = _kS()
                if _Av then
                    _K.Zone = {world = _L.worldName(), x = _Av.x, y = _Av.y - 0.475}
                end
                local _Aw, _Ax = _zX(_Ak, _Al, _Am)
                if _Aw > 0 then
                    local _Ay = ("Drop %s x%d di %s"):format(_dM(_Ak), _Aw, _L.worldName())
                    _K.Status = _Ay
                    _bH("Auto Rotasi", _Ay, 4)
                    _cz.send("pabrik", _Ay)
                end
                if _Ax then
                    _Ar, _As = false, _Ax
                end
            end
            if not _Ar then
                _K.DropOffUntil = os.clock() + 120
                _K.Status = "Drop gagal: " .. tostring(_As)
                _bH("Auto Rotasi", _K.Status, 5)
                _cz.send("pabrik", _K.Status)
            end
            if _Aq and _Ap ~= "" and _Am() then
                _K.Status = "Pulang ke " .. _Ap
                local _Az = _zS(_Ap, nil)
                if not _Az and _Am() then
                    task.wait(5)
                    _Az = _zS(_Ap, nil)
                end
                if not _Az then
                    _K.Traveling = false
                    if _K.stop then
                        _K.stop("Gagal pulang ke world farming " .. _Ap)
                    end
                    return
                end
            end
            _K.Traveling = false
        end
        local _AA = {panen = "PANEN", tanam = "TANAM", ["break"] = "BREAK", tunggu = "TUNGGU"}
        local function _AB()
            return _K.BreakX >= 0 and next(_K.Tiles) ~= nil and os.clock() >= (_K.BreakFailUntil or 0)
        end
        local function _AC(_AD)
            local _AE, _AF = _dP(_AD.seed), _dP(_AD.block)
            _AD.phase = _AD.phase or "panen"
            _K.Phase = _AA[_AD.phase]
            if _AD.phase ~= "panen" and _AD.phase ~= "tanam" and _AD.drop and _K.Drop and _AE >= _K.DropAt and _AE > _K.Keep and os.clock() >= (_K.DropOffUntil or 0) then
                _Aj(_AD.seed, _AE - _K.Keep, _AD.live)
                return "drop"
            end
            if _AD.phase == "panen" then
                local _thresholdBlock = math.max(1, math.floor(_K.BlockThreshold or 200))
                local _thresholdSeed = math.max(1, math.floor(_K.SeedThreshold or _zw))
                if _AF > _thresholdBlock then
                    _AD.phase = "break"
                    return "next"
                elseif _AE > _thresholdSeed then
                    _AD.phase = "tanam"
                    return "next"
                end
                _ut = _zx(_AD, true, false)
                local _AG = _vP()
                if _AG == "idle" then
                    _AD.idleAt = os.clock()
                    if _dP(_AD.seed) > _thresholdSeed then
                        _AD.phase = "tanam"
                    elseif _dP(_AD.block) > _thresholdBlock then
                        _AD.phase = "break"
                    else
                        _AD.phase = "tunggu"
                    end
                    return "next"
                end
                return _AG
            end
            if _AD.phase == "tanam" then
                if _AE > 0 then
                    _ut = _zx(_AD, false, true)
                    local _AH = _vP()
                    if _AH ~= "idle" then
                        return _AH
                    end
                end
                if _dP(_AD.block) > math.max(1, math.floor(_K.BlockThreshold or 200)) then
                    _AD.phase = "break"
                else
                    _AD.phase = "tunggu"
                end
                return "next"
            end
            if _AD.phase == "break" then
                local _AI
                if _AD.breakMode == "always" then
                    _AI = _AF > 0
                else
                    local _AJ, _AK = _zg(_AD.whole)
                    _AI = _AF > 0 and _AE < _zv and _AK == nil
                end
                if _AI and _AB() then
                    local _didBreak = false
                    local _separate = _K.WorldMode == "separate"
                    local _breakWorld = tostring(_K.BreakWorld or ""):upper():gsub("%s", "")
                    if _separate and _breakWorld ~= "" and _L.worldName() ~= _breakWorld then
                        _K.Traveling = true
                        _K.Status = "Menuju world break " .. _breakWorld
                        local _entered = _zS(_breakWorld, nil)
                        if _entered and _AD.live() then
                            _didBreak = _zE(_AD)
                        else
                            _K.Status = "Gagal masuk world break " .. _breakWorld
                        end
                        if _K.Home ~= "" and _L.worldName() ~= _K.Home and _AD.live() then
                            _K.Status = "Kembali ke world farming " .. _K.Home
                            local _returned = _zS(_K.Home, nil)
                            if not _returned then
                                _K.Traveling = false
                                if _K.stop then _K.stop("Gagal kembali ke world farming " .. _K.Home) end
                                return "idle"
                            end
                        end
                        _K.Traveling = false
                    else
                        _didBreak = _zE(_AD)
                    end
                    if _didBreak then
                        local _leftBlocks = _dP(_AD.block)
                        local _leftSeeds = _dP(_AD.seed)
                        if _leftSeeds > math.max(1, math.floor(_K.SeedThreshold or _zw)) then
                            _AD.phase = "tanam"
                        elseif _leftBlocks <= 0 then
                            _AD.phase = "panen"
                        end
                        return "break"
                    end
                end
                _AD.phase = "tunggu"
                return "next"
            end
            local _AL, _AM = _zg(_AD.whole)
            if _AL > 0 and os.clock() - (_AD.idleAt or 0) > 5 then
                _AD.phase = "panen"
                return "next"
            end
            if _AD.breakMode == "always" and _AF > math.max(1, math.floor(_K.BlockThreshold or 200)) and _AB() then
                _AD.phase = "break"
                return "next"
            end
            if _AE > 0 and os.clock() - (_AD.plantAt or 0) > 10 then
                _AD.plantAt = os.clock()
                _AD.phase = "tanam"
                return "next"
            end
            return "idle", _AM
        end
        local function _AN(_AO)
            _AO = math.max(0, math.ceil(_AO or 0))
            if _AO >= 60 then
                return ("%dm %dd"):format(_AO // 60, _AO % 60)
            end
            return _AO .. " dtk"
        end
        local function _AP(_AQ)
            local function _AR()
                return _K.Running and _e() and _K.RunId == _AQ
            end
            local _AS = {seed = _K.SeedId, block = _K.BlockId, drop = true, breakMode = "always", live = _AR}
            while _AR() do
                task.wait()
                _AS.whole = _K.WholeWorld
                local _AT = _L.worldName()
                if not _K.Traveling and _K.Home ~= "" and _AT ~= _K.Home then
                    _K.Status = "Bukan di world farming (" .. _K.Home .. "), menunggu..."
                    task.wait(2)
                    continue
                end
                local _AU, _AV = _AC(_AS)
                if _AU == "idle" then
                    local _AW, _AX = _dP(_AS.seed), _dP(_AS.block)
                    if not _AV and _AW <= 0 and _AX <= 0 then
                        if _K.stop then
                            _K.stop("Seed & block habis, tidak ada pohon tumbuh")
                        end
                        break
                    end
                    if _AV then
                        _K.Status = "Menunggu pohon siap ±" .. _AN(_AV)
                    elseif _AX > 0 and (_K.BreakX < 0 or next(_K.Tiles) == nil) then
                        _K.Status = "Ada block tapi posisi / tile break belum diatur"
                    elseif _AW > 0 then
                        _K.Status = "Lahan penuh, menunggu"
                    else
                        _K.Status = "Menunggu..."
                    end
                    if not _oZ(1000) then
                        break
                    end
                end
            end
            _oX()
        end
        function _K.stop(_AY)
            _K.Running = false
            _K.Traveling = false
            if _D.Override then
                _D.Running = false
            end
            _qQ()
            _oX()
            _K.Status = _AY or "Dihentikan"
            if _S.PabrikToggle then
                pcall(function()
                    _S.PabrikToggle:Set(false)
                end)
            end
            if _AY then
                _bH("Auto Rotasi", _AY, 5)
                if not string.find(_AY, "^Dihentikan") then
                    _cz.send("pabrik", "Auto Rotasi berhenti: " .. _AY)
                end
            end
        end
        function _K.start()
            if _K.Running then
                return
            end
            local _farmTarget = tostring(_K.FarmWorld or ""):upper():gsub("%s", "")
            if _farmTarget ~= "" and _L.worldName() ~= _farmTarget then
                if not _P.World or not _iM or not _kS() then
                    _bH("Noxablox", "Hubungkan ke game dan masuk world dulu sebelum menuju farming world", 5)
                    return
                end
                _K.Traveling = true
                local _farmEntered = _zS(_farmTarget, nil)
                _K.Traveling = false
                if not _farmEntered then
                    _bH("Noxablox", "Gagal masuk farming world " .. _farmTarget, 5)
                    return
                end
            end
            local _AZ
            local _Ba = _zc(_K.SeedId)
            if not _P.World then
                _AZ = "Data world belum ketemu. Tekan 'Hubungkan ke game'"
            elseif not _iM then
                _AZ = "Kontrol gerak game (WorldMenu.isDown) tidak ketemu"
            elseif not _kS() then
                _AZ = "Kamu belum masuk world"
            elseif _K.WorldMode == "separate" and tostring(_K.BreakWorld or ""):gsub("%s", "") == "" then
                _AZ = "Isi world break untuk mode Separate World"
            elseif not _K.SeedId then
                _AZ = "Pilih seed rotasi dulu"
            elseif not _Ba then
                _AZ = "Block pasangan seed ini tidak ditemukan"
            elseif not _K.WholeWorld and #_yc() == 0 and next(_K.FarmTiles) == nil then
                _AZ = "Atur tile farming (Grid) atau lahan dulu"
            elseif not _K.WholeWorld and next(_K.FarmTiles) ~= nil and next(_rotationFarmSet()) == nil then
                _AZ = "Pilih ulang tile farming dari world farming"
            elseif _K.BreakX < 0 or next(_K.Tiles) == nil then
                _AZ = "Atur posisi dan tile break terlebih dahulu"
            end
            if _AZ then
                _bH("Auto Rotasi", _AZ, 4)
                if _S.PabrikToggle then
                    pcall(function()
                        _S.PabrikToggle:Set(false)
                    end)
                end
                return
            end
            if _D.Running and not _D.Override then
                _iR("Dihentikan karena Auto Rotasi dimulai")
            end
            if _F.Running then
                _kf("Dihentikan karena Auto Rotasi dimulai")
            end
            if _M.Running then
                _kg("Dihentikan karena Auto Rotasi dimulai")
            end
            if _H.Running and _H.stop then
                _H.stop("Dihentikan karena Auto Rotasi dimulai")
            end
            if not _P.Trees then
                _tG()
            end
            _K.BlockId = _Ba
            _K.Home = _L.worldName()
            _K.FarmWorld = _K.Home
            if _K.WorldMode == "separate" then
                _K.BreakWorld = tostring(_K.BreakWorld or ""):upper():gsub("%s", "")
            end
            table.clear(_K.Skip)
            table.clear(_kn)
            _K.DropOffUntil, _K.BreakFailUntil = 0, 0
            _K.Running = true
            _K.RunId = (_K.RunId or 0) + 1
            _K.Status = "Mulai..."
            _qP()
            if _S.PabrikToggle then
                pcall(function()
                    _S.PabrikToggle:Set(true)
                end)
            end
            local _Bb = _K.RunId
            task.spawn(function()
                local _Bc, _Bd = pcall(_AP, _Bb)
                if not _Bc then
                    warn("[Noxablox] Auto Rotasi error: " .. tostring(_Bd))
                    if _K.Running then
                        _K.stop("Error: " .. tostring(_Bd))
                    end
                end
            end)
        end
        local _Be = {}
        local function _Bf(_Bg, _Bh, _Bi)
            return _Bg + 1 > _Bi.x - 0.3 and _Bg < _Bi.x + 0.3 and _Bh + 1 > _Bi.y - 0.95 and _Bh < _Bi.y
        end
        local function _Bj(_Bk)
            local _Bl = _P.World
            local _Bm = _yc()
            for _Bn = #_Bm, 1, -1 do
                local _Bo = _Bm[_Bn]
                local _Bp, _Bq = _yi(_Bn - 1)
                local _Br = {}
                for _Bs = _Bp, _Bq do
                    local _Bt = _Bo * _Bl.w + _Bs
                    if _kV(_Bs, _Bo) == 0 and not _kz(_J.Skip, _Bt, _Bk) then
                        _Br[#_Br + 1] = {x = _Bs, y = _Bo, idx = _Bt}
                    end
                end
                if #_Br > 0 then
                    return _Br
                end
            end
            return {}
        end
        local function _Bu(_Bv, _Bw)
            local _Bx = _J.BlockId
            if _dP(_Bx) <= 0 or _Bf(_Bv.x, _Bv.y, _Bw) then
                return false
            end
            if not _lS(_Bv.x, _Bv.y) then
                _kv(_J.Skip, _Bv.idx, 120)
                return false
            end
            _fx("fg", _Bv.x, _Bv.y, _Bx)
            pcall(function()
                _P.Inv:remove(_Bx, 1)
            end)
            _J.Placed += 1
            _J.Status = ("Pasang %s (%d,%d)"):format(_dM(_Bx), _Bv.x, _Bv.y)
            return true
        end
        local function _By()
            local _Bz = _P.World
            local _BA = _kS()
            if not _Bz or not _BA or _BA.dead then
                _oX()
                task.wait(0.5)
                return "wait"
            end
            if not _BA.grounded then
                _oX()
                task.wait()
                return "wait"
            end
            _oX()
            local _BB = _Bj(os.clock())
            if #_BB == 0 then
                return "none"
            end
            local _BC = _kR() - 0.08
            local _BD = 0
            for _BE, _BF in ipairs(_BB) do
                if not _J.Running or not _e() then
                    return "wait"
                end
                local _BG = _kS()
                if not _BG then
                    break
                end
                if _kV(_BF.x, _BF.y) == 0 and _lE(_BG, _BF.x, _BF.y, _BC) and _Bu(_BF, _BG) then
                    _BD += 1
                    if not _oZ(_D.PlaceMs) then
                        return "wait"
                    end
                end
            end
            if _BD > 0 then
                return "work"
            end
            local _BH = _kk(_BA.x)
            table.sort(_BB, function(_BI, _BJ)
                return _kl(_BI.x - _BH) < _kl(_BJ.x - _BH)
            end)
            local _BK = {}
            for _BL = 1, math.min(8, #_BB) do
                _BK[_BL] = _BB[_BL]
            end
            local _BM, _BN = _me(_BA)
            _qt(_BM, _BN, _BK, _kR() - 0.35, _lP() ~= nil, _J.Skip, _Be)
            return "move"
        end
        function _J.stop(_BO)
            _J.Running = false
            if _K.Running == false and _D.Override then
                _D.Running = false
            end
            _qQ()
            _oX()
            _J.Phase = _BO or "Dihentikan"
            if _S.BuildToggle then
                pcall(function()
                    _S.BuildToggle:Set(false)
                end)
            end
            if _BO then
                _bH("Bangun Lahan", _BO, 5)
                if not string.find(_BO, "^Dihentikan") then
                    _cz.send("pabrik", "Bangun Lahan: " .. _BO)
                end
            end
        end
        local function _BP(_BQ)
            local function _BR()
                return _J.Running and _e() and _J.RunId == _BQ
            end
            local _BS = _yX(_J.BlockId)
            local _BT = {
                seed = _BS,
                block = _J.BlockId,
                drop = false,
                breakMode = "bootstrap",
                whole = true,
                live = _BR
            }
            local _BU = nil
            while _BR() do
                task.wait()
                local _BV = _yJ(_J.BlockId)
                _J.Info = _BV
                if _BV.need == 0 then
                    _J.stop("Lahan selesai (" .. _BV.done .. " block)")
                    if _J.ThenPabrik then
                        if not _K.SeedId then
                            _K.SeedId = _BS
                        end
                        _K.start()
                    end
                    break
                end
                local _BW = _dP(_J.BlockId)
                local _BX = math.min(_BV.need, _zw)
                if _BU == nil then
                    _BU = (_BW >= _BX or not _J.Produce) and "bangun" or "produksi"
                end
                if _BU == "produksi" then
                    if _BW >= _BX then
                        _BU = "bangun"
                        _bH("Bangun Lahan", "Block cukup (" .. _BW .. "), mulai pasang", 4)
                    elseif not _BS then
                        _J.stop(("Block kurang %d dan seed-nya tidak ketemu"):format(_BV.need - _BW))
                        break
                    else
                        _J.Phase = ("Produksi block %d / %d (total butuh %d)"):format(_BW, _BX, _BV.need)
                        _BT.exclude = _yt()
                        local _BY, _BZ = _AC(_BT)
                        _J.Status = _K.Status
                        if _BY == "idle" then
                            if not _BZ and _dP(_BS) <= 0 and _BW <= 0 then
                                _J.stop("Seed & block habis. Butuh " .. _BV.need .. " block")
                                break
                            end
                            if not _BZ and _dP(_BS) <= 0 and (_K.BreakX < 0 or next(_K.Tiles) == nil) then
                                _J.Status = ("Seed habis: atur posisi & tile break di tab Auto Rotasi supaya bisa d" .. "apat seed")
                            end
                            if not _oZ(1000) then
                                break
                            end
                        end
                    end
                else
                    if _BW <= 0 then
                        if _J.Produce and _BS then
                            _BU = "produksi"
                        else
                            _J.stop("Block habis, masih kurang " .. _BV.need)
                            break
                        end
                    else
                        _J.Phase = ("Pasang lahan: sisa %d tile"):format(_BV.need)
                        local _Ca = _By()
                        if _Ca == "none" then
                            _J.Status = "Sisa tile belum terjangkau / terhalang, dicoba lagi"
                            if not _oZ(1500) then
                                break
                            end
                        end
                    end
                end
            end
            _oX()
        end
        function _J.start()
            if _J.Running then
                return
            end
            local _Cb
            local _Cc = _J.BlockId and _p[_J.BlockId]
            if not _P.World then
                _Cb = "Data world belum ketemu. Tekan 'Hubungkan ke game'"
            elseif not _iM then
                _Cb = "Kontrol gerak game (WorldMenu.isDown) tidak ketemu"
            elseif not _kS() then
                _Cb = "Kamu belum masuk world"
            elseif not (_Cc and _Cc.solid) then
                _Cb = "Pilih block padat untuk lahan"
            elseif #_yc() == 0 then
                _Cb = "Atur lahan dulu (Y awal / jumlah baris)"
            end
            if _Cb then
                _bH("Bangun Lahan", _Cb, 4)
                if _S.BuildToggle then
                    pcall(function()
                        _S.BuildToggle:Set(false)
                    end)
                end
                return
            end
            if _D.Running and not _D.Override then
                _iR("Dihentikan karena Bangun Lahan dimulai")
            end
            if _F.Running then
                _kf("Dihentikan karena Bangun Lahan dimulai")
            end
            if _M.Running then
                _kg("Dihentikan karena Bangun Lahan dimulai")
            end
            if _H.Running and _H.stop then
                _H.stop("Dihentikan karena Bangun Lahan dimulai")
            end
            if _K.Running then
                _K.stop("Dihentikan karena Bangun Lahan dimulai")
            end
            if not _P.Trees then
                _tG()
            end
            table.clear(_J.Skip)
            table.clear(_Be)
            table.clear(_K.Skip)
            table.clear(_kn)
            _K.BreakFailUntil = 0
            _J.Running = true
            _J.RunId = (_J.RunId or 0) + 1
            _J.Phase = "Menghitung..."
            _qP()
            if _S.BuildToggle then
                pcall(function()
                    _S.BuildToggle:Set(true)
                end)
            end
            local _Cd = _J.RunId
            task.spawn(function()
                local _Ce, _Cf = pcall(_BP, _Cd)
                if not _Ce then
                    warn("[Noxablox] Bangun Lahan error: " .. tostring(_Cf))
                    if _J.Running then
                        _J.stop("Error: " .. tostring(_Cf))
                    end
                end
            end)
        end
        _kj.landInfo = _yJ
        _kj.landRows = _yc
        _kj.seedOfBlock = _yX
        _kj.blockOfSeed = _zc
        _kj.parseDropTarget = _zO
        _kj.walkTo = _xQ
        _kj.startSpliceRoam = _xL
        _kj.stopSpliceRoam = _xP
        _kj.treeReadyAt = _ua
        _kj.plantSpotOk = _ui
        _kj.stopWalk = function()
            _km.Homing = false
        end
        _kj.here = function()
            local _Cg = _kS()
            if _Cg then
                return _me(_Cg)
            end
            return nil
        end
        _kj.startClear = _tC
        _kj.startFarmer = _wh
        _kj.updateClearStatus = _td
        _kj.updateFarmerStatus = _vM
        _kj.findTreeRefs = _tG
        _kj.releaseInput = _oX
        _kj.BadEdge = _kn
        _kj.ClearFail = _ko
        _kj.resetReach = function()
            _kr = nil
        end
    end)()
end
local _Ch = game:GetService("TextChatService")

local function _Ci()
    local _Cj = _Ch:FindFirstChild("WorldChannels")
    if not _Cj then
        return nil
    end
    local _Ck = _P.World and _P.World.name
    if type(_Ck) == "string" and _Ck ~= "" then
        local _Cl = _Cj:FindFirstChild(_Ck)
        if _Cl then
            return _Cl
        end
    end
    for _Cm, _Cn in ipairs(_Cj:GetChildren()) do
        if _Cn:IsA("TextChannel") then
            for _Co, _Cp in ipairs(_Cn:GetChildren()) do
                if _Cp:IsA("TextSource") and _Cp.UserId == _k.UserId then
                    return _Cn
                end
            end
        end
    end
    return nil
end

local function _Cq(_Cr)
    local _Cs = {}
    for _Ct in string.gmatch(_Cr or "", "[^|\n]+") do
        _Ct = _Ct:gsub("^%s+", ""):gsub("%s+$", "")
        if _Ct ~= "" then
            _Cs[#_Cs + 1] = _Ct
        end
    end
    return _Cs
end
local _Cu = nil

local function _Cv()
    if not _S.SpamStatus then
        return
    end
    local _Cw = "Status   : " .. (_O.On and "JALAN" or "BERHENTI") .. "\nPesan    : " .. #_O.Texts .. " (bergantian)" .. "\nTerkirim : " .. _O.Sent .. "\nTerakhir : " .. _O.Last
    if _Cw == _Cu then
        return
    end
    _Cu = _Cw
    task.defer(function()
        pcall(function()
            _S.SpamStatus:SetDesc(_Cw)
        end)
    end)
end

local function _Cx()
    if #_O.Texts == 0 then
        _O.Last = "Daftar pesan kosong"
        return false
    end
    local _Cy = _Ci()
    if not _Cy then
        _O.Last = "Channel chat world belum ada (masuk world dulu)"
        return false
    end
    if _O.Index > #_O.Texts then
        _O.Index = 1
    end
    local _Cz = _O.Texts[_O.Index]
    _O.Index = _O.Index % #_O.Texts + 1
    local _CA, _CB = pcall(_Cy.SendAsync, _Cy, _Cz)
    if _CA then
        _O.Sent += 1
        _O.Last = _Cz
    else
        _O.Last = "Gagal: " .. tostring(_CB)
    end
    return _CA
end
_O.NextAt = 0
task.spawn(function()
    while _e() do
        if _O.On and os.clock() >= _O.NextAt then
            _Cx()
            _O.NextAt = os.clock() + math.max(3, _O.IntervalSec)
            _Cv()
        end
        task.wait(0.25)
    end
end)
local _CC = game:GetService("TextService")
local _CD = {t0 = os.clock()}
local _CE = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 90, 255)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(60, 205, 255)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 110, 210)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(60, 205, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 90, 255)),
})
local _CF = Enum.Font.FredokaOne

local function _CG()
    local _CH = _l:FindFirstChild("GameGui")
    local _CI = _CH and _CH:FindFirstChild("World")
    local _CJ = _CI and _CI:FindFirstChild("Camera")
    local _CK = _l:FindFirstChild("ChatGui")
    local _CL = _CK and _CK:FindFirstChild("HUD")
    local _CM = _CL and _CL:FindFirstChild("PlayerPanel")
    return _CJ and _CJ:FindFirstChild("NameTag"), _CM and _CM:FindFirstChild("Name")
end

local function _CN(_CO, _CP)
    local _CQ, _CR = pcall(_CC.GetTextSize, _CC, _CO, _CP, _CF, Vector2.new(2000, 200))
    return (_CQ and _CR.X or #_CO * _CP * 0.55) + 6
end

local function _CS(_CT, _CU, _CV)
    local _CW = Instance.new("TextLabel")
    _CW.Name = "FianName"
    _CW.BackgroundTransparency = 1
    _CW.Font = _CF
    _CW.TextSize = _CU
    _CW.TextColor3 = Color3.new(1, 1, 1)
    _CW.Text = _E.NameText
    _CW.ZIndex = _CV and 1017 or 10
    if _CV then
        _CW.AnchorPoint = Vector2.new(0.5, 0.5)
        _CW.Position = UDim2.fromScale(0.5, 0.5)
    else
        _CW.AnchorPoint = Vector2.new(0, 0.5)
        _CW.Position = UDim2.new(0, 3, 0.5, 0)
        _CW.TextXAlignment = Enum.TextXAlignment.Left
    end
    local _CX = Instance.new("UIStroke")
    _CX.Thickness = 2
    _CX.Color = Color3.fromRGB(25, 12, 40)
    _CX.Transparency = 0.1
    _CX.Parent = _CW
    local _CY = Instance.new("UIGradient")
    _CY.Color = _CE
    _CY.Rotation = 12
    _CY.Parent = _CW
    local _CZ = Instance.new("UIScale")
    _CZ.Parent = _CW
    _CW.Parent = _CT
    return {
        holder = _CT,
        bitmap = _CT:FindFirstChild("BitmapText"),
        label = _CW,
        gr = _CY,
        sc = _CZ,
        size = _CU,
        isTag = _CV,
        text = nil,
        w = 0
    }
end

local function _Da(_Db)
    if not _Db then
        return
    end
    pcall(function()
        _Db.label:Destroy()
    end)
    if _Db.bitmap then
        pcall(function()
            _Db.bitmap.Visible = true
        end)
    end
    if _Db.isTag and _Db.bitmap then
        pcall(function()
            local _Dc = _Db.bitmap.Size.X.Offset
            _Db.holder.Size = UDim2.fromOffset(_Dc, _Db.holder.Size.Y.Offset)
            local _Dd = _Db.holder:FindFirstChild("Wrench")
            if _Dd then
                _Dd.Position = UDim2.fromOffset(_Dc + 4, _Dd.Position.Y.Offset)
            end
        end)
    end
end

local function _De()
    _Da(_CD.tag)
    _Da(_CD.panel)
    _CD.tag, _CD.panel = nil, nil
end

local function _Df(_Dg, _Dh, _Di, _Dj)
    if not _Dh then
        _Da(_Dg)
        return nil
    end
    if not _Dg or _Dg.holder ~= _Dh or not _Dg.label.Parent then
        _Da(_Dg)
        _Dg = _CS(_Dh, _Di, _Dj)
    end
    if _Dg.text ~= _E.NameText then
        _Dg.text = _E.NameText
        _Dg.label.Text = _E.NameText
        _Dg.w = _CN(_E.NameText, _Di)
    end
    if _Dg.bitmap and _Dg.bitmap.Visible then
        _Dg.bitmap.Visible = false
    end
    if _Dj then
        local _Dk = math.max(_Dh.Size.Y.Offset, _Di + 6)
        if _Dg.label.Size.X.Offset ~= _Dg.w or _Dg.label.Size.Y.Offset ~= _Dk then
            _Dg.label.Size = UDim2.fromOffset(_Dg.w, _Dk)
        end
        if _Dh.Size.X.Offset ~= _Dg.w then
            _Dh.Size = UDim2.fromOffset(_Dg.w, _Dh.Size.Y.Offset)
        end
        local _Dl = _Dh:FindFirstChild("Wrench")
        if _Dl and _Dl.Position.X.Offset ~= _Dg.w + 4 then
            _Dl.Position = UDim2.fromOffset(_Dg.w + 4, _Dl.Position.Y.Offset)
        end
    else
        _Dg.label.Size = UDim2.new(1, -6, 1, 0)
    end
    return _Dg
end
table.insert(_T, _h.RenderStepped:Connect(function()
    if not _e() or not _E.CustomName then
        return
    end
    local _Dm, _Dn = _CG()
    _CD.tag = _Df(_CD.tag, _Dm, 22, true)
    _CD.panel = _Df(_CD.panel, _Dn, 21, false)
    local _Do = os.clock() - _CD.t0
    local _Dp = Vector2.new(((_Do * 0.45) % 2) - 1, 0)
    local _Dq = 1 + 0.045 * math.sin(_Do * 3.2)
    local _Dr, _Ds = _CD.tag, _CD.panel
    if _Dr then
        _Dr.gr.Offset = _Dp
        _Dr.sc.Scale = _Dq
    end
    if _Ds then
        _Ds.gr.Offset = _Dp
        _Ds.sc.Scale = _Dq
    end
end))
table.insert(_T, _k.Idled:Connect(function()
    if _D.AntiAfk and _e() then
        _i:CaptureController()
        _i:ClickButton2(Vector2.new())
    end
end))
local _Dt = (gethui and gethui()) or game:GetService("CoreGui")

local function _Du(_Dv)
    local _Dw = Instance.new("ScreenGui")
    _Dw.Name = _Dv
    _Dw.ResetOnSpawn = false
    _Dw.IgnoreGuiInset = true
    _Dw.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _Dw.DisplayOrder = 999
    _Dw.Enabled = false
    if syn and syn.protect_gui then
        pcall(syn.protect_gui, _Dw)
    end
    _Dw.Parent = _Dt
    return _Dw
end
local _Dx = 2
local _Dy = 38
local _Dz = 4
local _DA = _Du("NoxabloxGrid")
_S.GridGui = _DA
local _DB = _Dx * 2 + 1
local _DC = _DB * _Dy + (_DB - 1) * _Dz
local _DD = Instance.new("Frame")
_DD.Size = UDim2.fromOffset(_DC + 20, _DC + 96)
_DD.Position = UDim2.fromOffset(20, 80)
_DD.BackgroundColor3 = Color3.fromRGB(15, 18, 30)
_DD.BorderSizePixel = 0
_DD.Parent = _DA
Instance.new("UICorner", _DD).CornerRadius = UDim.new(0, 10)
local _DE = Instance.new("UIStroke", _DD)
_DE.Color = Color3.fromRGB(78, 86, 125)
local _DF = Instance.new("TextLabel")
_DF.Size = UDim2.new(1, -40, 0, 28)
_DF.Position = UDim2.fromOffset(10, 4)
_DF.BackgroundTransparency = 1
_DF.Font = Enum.Font.GothamBold
_DF.TextSize = 13
_DF.TextXAlignment = Enum.TextXAlignment.Left
_DF.TextColor3 = Color3.fromRGB(235, 235, 245)
_DF.Text = _W.T("Grid Tile")
_DF.Parent = _DD
local _DG = Instance.new("TextButton")
_DG.Size = UDim2.fromOffset(24, 24)
_DG.Position = UDim2.new(1, -30, 0, 6)
_DG.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
_DG.Text = "X"
_DG.Font = Enum.Font.GothamBold
_DG.TextSize = 12
_DG.TextColor3 = Color3.new(1, 1, 1)
_DG.Parent = _DD
Instance.new("UICorner", _DG).CornerRadius = UDim.new(0, 6)
_DG.MouseButton1Click:Connect(function()
    _DA.Enabled = false
end)
local _DH = Instance.new("Frame")
_DH.Size = UDim2.fromOffset(_DC, _DC)
_DH.Position = UDim2.fromOffset(10, 36)
_DH.BackgroundTransparency = 1
_DH.Parent = _DD
local _DI = Color3.fromRGB(34, 40, 61)
local _DJ = Color3.fromRGB(105, 91, 230)
local _DK = Color3.fromRGB(38, 174, 190)
local _DL = {}
_S.GridMode = "farm"
_S.gridTarget = function()
    if _S.GridMode == "pabrik" then
        return _K.Tiles
    elseif _S.GridMode == "rotasi_farm" then
        return _K.FarmTiles
    end
    return _D.Offsets
end

local function _DM(_DN)
    local _DO = _DL[_DN]
    if _DO then
        _DO.BackgroundColor3 = _S.gridTarget()[_DN] and _DJ or _DI
    end
end
for _DP = 0, _DB - 1 do
    for _DQ = 0, _DB - 1 do
        local _DR, _DS = _DQ - _Dx, _DP - _Dx
        local _DT = _DR .. "," .. _DS
        local _DU = Instance.new("TextButton")
        _DU.Size = UDim2.fromOffset(_Dy, _Dy)
        _DU.Position = UDim2.fromOffset(_DQ * (_Dy + _Dz), _DP * (_Dy + _Dz))
        _DU.Font = Enum.Font.GothamBold
        _DU.TextSize = 12
        _DU.TextColor3 = Color3.new(1, 1, 1)
        _DU.Parent = _DH
        Instance.new("UICorner", _DU).CornerRadius = UDim.new(0, 6)
        if _DR == 0 and _DS == 0 then
            _DU.Text = "ME"
            _DU.BackgroundColor3 = _DK
            _DU.AutoButtonColor = false
        else
            _DU.Text = ""
            _DU.BackgroundColor3 = _S.gridTarget()[_DT] and _DJ or _DI
            _DL[_DT] = _DU
            _DU.MouseButton1Click:Connect(function()
                local _DV = _S.gridTarget()
                _DV[_DT] = (not _DV[_DT]) or nil
                _DM(_DT)
                _id()
            end)
        end
    end
end
local _DW = Instance.new("TextButton")
_DW.Size = UDim2.new(1, -20, 0, 30)
_DW.Position = UDim2.new(0, 10, 1, -54)
_DW.BackgroundColor3 = _DJ
_DW.Font = Enum.Font.GothamBold
_DW.TextSize = 14
_DW.TextColor3 = Color3.new(1, 1, 1)
_DW.Text = "START"
_DW.Parent = _DD
Instance.new("UICorner", _DW).CornerRadius = UDim.new(0, 8)
_S.GridStart = _DW
_DW.MouseButton1Click:Connect(function()
    if _S.GridMode == "pabrik" then
        if _K.Running then
            _K.stop()
        else
            _K.start()
        end
    elseif _S.GridMode == "rotasi_farm" then
        _DA.Enabled = false
        _K.Status = "Tile farming tersimpan: " .. tostring((function() local n=0 for _ in pairs(_K.FarmTiles) do n+=1 end return n end)())
        _bH("Noxablox", _K.Status, 3)
    elseif _D.Running and not _D.Override then
        _iR()
    else
        _kh()
    end
end)
local _DX = Instance.new("TextButton")
_DX.Size = UDim2.new(1, -20, 0, 18)
_DX.Position = UDim2.new(0, 10, 1, -22)
_DX.BackgroundTransparency = 1
_DX.Font = Enum.Font.Gotham
_DX.TextSize = 12
_DX.TextColor3 = Color3.fromRGB(180, 180, 195)
_DX.Text = _W.T("Bersihkan pilihan")
_DX.Parent = _DD
_DX.MouseButton1Click:Connect(function()
    local _DY = _S.gridTarget()
    for _DZ in pairs(_DY) do
        _DY[_DZ] = nil
        _DM(_DZ)
    end
    _id()
end) do
    (function()
        local _Ea = Instance.new("TextButton")
        _Ea.Size = UDim2.fromOffset(62, 22)
        _Ea.Position = UDim2.new(1, -98, 0, 7)
        _Ea.Font = Enum.Font.GothamBold
        _Ea.TextSize = 11
        _Ea.TextColor3 = Color3.new(1, 1, 1)
        _Ea.Parent = _DD
        Instance.new("UICorner", _Ea).CornerRadius = UDim.new(0, 6)
        _DF.Size = UDim2.new(1, -106, 0, 28)
        local function _Eb()
            local _mode = _S.GridMode
            _Ea.Text = _mode == "pabrik" and "BREAK" or (_mode == "rotasi_farm" and "FARM" or "AUTO")
            _Ea.BackgroundColor3 = _mode == "pabrik" and Color3.fromRGB(196, 119, 74) or (_mode == "rotasi_farm" and Color3.fromRGB(38, 174, 190) or Color3.fromRGB(60, 68, 96))
            _DF.Text = _W.T(_mode == "pabrik" and "Tile Break Rotasi" or (_mode == "rotasi_farm" and "Tile Farming Rotasi" or "Grid Tile Auto Farm"))
            for _Ed in pairs(_DL) do
                _DM(_Ed)
            end
            if _mode == "pabrik" then
                _DW.Text = _W.T(_K.Running and "STOP ROTASI" or "START ROTASI")
                _DW.BackgroundColor3 = _K.Running and Color3.fromRGB(200, 60, 60) or _DJ
            elseif _mode == "rotasi_farm" then
                _DW.Text = "SIMPAN TILE"
                _DW.BackgroundColor3 = _DJ
            else
                local _Ee = _D.Running and not _D.Override
                _DW.Text = _Ee and "STOP" or "START"
                _DW.BackgroundColor3 = _Ee and Color3.fromRGB(200, 60, 60) or _DJ
            end
        end
        _S.setGridMode = function(_Ef)
            _S.GridMode = _Ef
            if _Ef == "rotasi_farm" then
                local _x, _y = _kj.here()
                if _x then
                    _K.FarmAnchorX, _K.FarmAnchorY = _x, _y
                end
            end
            _Eb()
        end
        _Ea.MouseButton1Click:Connect(function()
            local _next = ({farm = "pabrik", pabrik = "rotasi_farm", rotasi_farm = "farm"})[_S.GridMode] or "farm"
            _S.setGridMode(_next)
        end)
        _Eb()
    end)()
end do
    (function()
        local _Eg, _Eh, _Ei
        _DF.Active = true
        _DF.InputBegan:Connect(function(_Ej)
            if _Ej.UserInputType == Enum.UserInputType.MouseButton1 or _Ej.UserInputType == Enum.UserInputType.Touch then
                _Eg = true
                _Eh = _Ej.Position
                _Ei = _DD.Position
                _Ej.Changed:Connect(function()
                    if _Ej.UserInputState == Enum.UserInputState.End then
                        _Eg = false
                    end
                end)
            end
        end)
        table.insert(_T, _j.InputChanged:Connect(function(_Ek)
            if _Eg and (_Ek.UserInputType == Enum.UserInputType.MouseMovement or _Ek.UserInputType == Enum.UserInputType.Touch) then
                local _El = _Ek.Position - _Eh
                _DD.Position = UDim2.new(_Ei.X.Scale, _Ei.X.Offset + _El.X, _Ei.Y.Scale, _Ei.Y.Offset + _El.Y)
            end
        end))
    end)()
end
task.spawn(function()
    while _e() do
        if _DA.Enabled then
            local _Em, _En = _fe()
            local _Eo = _Em and ("ME (" .. _Em .. "," .. _En .. ")") or _W.T("Grid Tile | tidak di world")
            if _DF.Text ~= _Eo then
                _DF.Text = _Eo
            end
        end
        task.wait(0.5)
    end
end)
local _Ep = _Du("NoxabloxFlyPad")
_S.FlyPad = _Ep

local function _Eq(_Er, _Es, _Et)
    local _Eu = Instance.new("TextButton")
    _Eu.Size = UDim2.fromOffset(64, 64)
    _Eu.AnchorPoint = Vector2.new(1, 0.5)
    _Eu.Position = UDim2.new(1, -24, 0.5, _Es)
    _Eu.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    _Eu.BackgroundTransparency = 0.2
    _Eu.Text = _Er
    _Eu.Font = Enum.Font.GothamBold
    _Eu.TextSize = 28
    _Eu.TextColor3 = Color3.new(1, 1, 1)
    _Eu.AutoButtonColor = true
    _Eu.Parent = _Ep
    Instance.new("UICorner", _Eu).CornerRadius = UDim.new(1, 0)
    local _Ev = Instance.new("UIStroke", _Eu)
    _Ev.Color = Color3.fromRGB(90, 90, 120)
    _Ev.Thickness = 2
    local _Ew = nil
    _Eu.InputBegan:Connect(function(_Ex)
        if _Ex.UserInputType == Enum.UserInputType.Touch or _Ex.UserInputType == Enum.UserInputType.MouseButton1 then
            _Ew = _Ex
            _Et(true)
        end
    end)
    table.insert(_T, _j.InputEnded:Connect(function(_Ey)
        if _Ew and (_Ey == _Ew or (_Ey.UserInputType == Enum.UserInputType.MouseButton1 and _Ew.UserInputType == Enum.UserInputType.MouseButton1)) then
            _Ew = nil
            _Et(false)
        end
    end))
    return _Eu
end
_Eq("▲", -40, function(_Ez)
    _E.UpHeld = _Ez
end)
_Eq("▼", 40, function(_EA)
    _E.DownHeld = _EA
end) do
    (function()
        if not _W.Ask and _bL.saved("Bahasa", "Saved") then
            return
        end
        local _EB, _EC = false, false
        local function _ED(_EE)
            if _EC then
                _W.Saved = _EE
                _bL.save(true)
                _bH("Bahasa / Language", "Execute ulang untuk ganti bahasa / Re-execute to apply", 5)
                return
            end
            _W.Lang, _W.Saved, _EB = _EE, _EE, true
        end
        local _EF = pcall(function()
            _C:Popup({
                Title = "Noxablox",
                Icon = "languages",
                Content = "Pilih bahasa menu\nChoose menu language",
                Buttons = {
                    {
                        Title = "Indonesia",
                        Variant = _W.Lang == "id" and "Primary" or "Secondary",
                        Callback = function()
                            _ED("id")
                        end
                    },
                    {
                        Title = "English",
                        Variant = _W.Lang == "en" and "Primary" or "Secondary",
                        Callback = function()
                            _ED("en")
                        end
                    },
                },
            })
        end)
        if not _EF then
            return
        end
        local _EG = os.clock()
        while not _EB and os.clock() - _EG < 30 and _e() do
            task.wait(0.1)
        end
        _EC = not _EB
        if _EB then
            _bL.save(true)
        end
    end)()
end
local _EH = _W.wrap(_C:CreateWindow({
    Title = "Noxablox",
    Icon = "orbit",
    Author = "ROTATION AUTOMATION",
    Folder = "Noxablox",
    Size = UDim2.fromOffset(720, 470),
    Theme = "Dark",
    Transparent = false,
    SideBarWidth = 175,
}))
pcall(function()
    _EH:EditOpenButton({Title = "Noxablox", Icon = "orbit", Draggable = true})
end)

local function _EI(_EJ)
    local _EK, _EL = pcall(_EJ)
    if not _EK then
        warn("[Noxablox] UI error: " .. tostring(_EL))
    end
end
local _EM = {}
for _EN, _EO in ipairs({
    {key = "farm", title = "Noxablox", icon = "orbit", opened = true},
    {key = "aman", title = "Keamanan", icon = "shield-check", opened = true},
    {key = "setel", title = "Pengaturan", icon = "sliders-horizontal", opened = true},
}) do
    local _EP, _EQ = pcall(function()
        return _EH:Section({Title = _EO.title, Icon = _EO.icon, Opened = _EO.opened == true})
    end)
    if _EP and type(_EQ) == "table" and type(_EQ.Tab) == "function" then
        _EM[_EO.key] = _EQ
    end
end

-- Tab utama Noxablox: Beranda, Auto Rotasi, Penjaga, dan Koneksi.
local _AllowedTabs = { ["Farm"] = true, ["Penjaga"] = true, ["Koneksi"] = true, ["Auto Rotasi"] = true }
local _NullUI = {}
setmetatable(_NullUI, {
    __index = function(_t)
        return function()
            return _t
        end
    end,
})

local function _ER(_ES, _ET, _EU)
    if not _AllowedTabs[_ES] then
        return _NullUI
    end
    local _EV = (_EU and _EM[_EU]) or _EH
    local _tabLabels = {Farm = "Beranda", Penjaga = "Penjaga", Koneksi = "Koneksi", ["Auto Rotasi"] = "Auto Rotasi"}
    local _EW, _EX = pcall(function()
        return _EV:Tab({Title = _tabLabels[_ES] or _ES, Icon = _ET})
    end)
    if _EW and _EX then
        return _EX
    end
    return _EH:Tab({Title = _tabLabels[_ES] or _ES})
end

local function _EY(_EZ, _Fa, _Fb)
    local _Fc, _Fd = pcall(function()
        return _EZ:Section({Title = _Fa, Box = true, BoxBorder = true, Opened = _Fb == true})
    end)
    if _Fc and type(_Fd) == "table" and type(_Fd.Toggle) == "function" then
        return _Fd
    end
    pcall(function()
        _EZ:Section({Title = _Fa})
    end)
    return _EZ
end
local _Fe = {}

local function _Ff(_Fg, _Fh)
    local _Fj = pcall(function()
        _Fg:Slider({
            Title = _Fh.Title,
            Desc = _Fh.Desc,
            Step = _Fh.Step or 1,
            Value = {Min = _Fh.Min, Max = _Fh.Max, Default = _Fh.Default},
            Callback = function(_Fi)
                _Fi = tonumber(_Fi)
                if _Fi then
                    _Fh.Callback(_Fi)
                end
            end,
        })
    end)
    if _Fj then
        return
    end
    _EI(function()
        _Fg:Input({
            Title = _Fh.Title,
            Desc = (_Fh.Desc and (_Fh.Desc .. " ") or "") .. "(" .. _Fh.Min .. "-" .. _Fh.Max .. ")",
            Value = tostring(_Fh.Default),
            Placeholder = tostring(_Fh.Default),
            Callback = function(_Fk)
                local _Fl = tonumber(_Fk)
                if _Fl then
                    _Fh.Callback(math.clamp(_Fl, _Fh.Min, _Fh.Max))
                end
            end,
        })
    end)
end
local _Fm = _ER("Farm", "pickaxe", "farm")
_EI(function()
    _S.Status = _Fm:Paragraph({Title = "Status", Desc = "-"})
end)
_Fe.FarmCtl = _EY(_Fm, "Kontrol", true)
_Fe.FarmBlock = _EY(_Fm, "Block", true)
_Fe.FarmSpeed = _EY(_Fm, "Mode & Kecepatan", false)
_EI(function()
    _S.FarmToggle = _Fe.FarmCtl:Toggle({
        Title = "Auto Farm",
        Desc = "Bisa juga lewat tombol START di Grid",
        Value = false,
        Callback = function(_Fn)
            if _Fn then
                _kh()
            elseif _D.Running then
                _iR()
            end
        end,
    })
end)
_EI(function()
    _Fe.FarmCtl:Toggle({
        Title = "Auto Collect",
        Desc = "Ambil drop di tile yang dipilih",
        Value = _D.AutoCollect,
        Callback = function(_Fo)
            _D.AutoCollect = _Fo
        end,
    })
end)
_EI(function()
    _Fe.FarmCtl:Toggle({
        Title = "Collect di sekitar karakter",
        Desc = "Ambil semua drop dalam radius, kapan saja",
        Value = _D.CollectAround,
        Callback = function(_Fp)
            _D.CollectAround = _Fp
        end,
    })
end)
_Ff(_Fe.FarmCtl, {
    Title = "Radius collect (tile)",
    Desc = ("Dipakai juga Clear, Farmer, Splice & Pabrik. Terlalu jauh bisa d" .. "itolak server"),
    Min = 1,
    Max = 8,
    Step = 1,
    Default = _D.CollectRadius,
    Callback = function(_Fq)
        _D.CollectRadius = math.floor(_Fq)
    end,
})
_EI(function()
    _Fe.FarmCtl:Button({
        Title = "Buka Grid Tile",
        Desc = "Kotak 5x5, tengah = karakter",
        Callback = function()
            _DA.Enabled = true
        end,
    })
end)
local _Fr = _ER("Clear World", "eraser", "farm")
_EI(function()
    _S.ClearStatus = _Fr:Paragraph({Title = "Status Clear", Desc = "-"})
end)
_Fe.ClearCtl = _EY(_Fr, "Kontrol", true)
_Fe.ClearSet = _EY(_Fr, "Pengaturan", false)
_EI(function()
    _S.ClearToggle = _Fe.ClearCtl:Toggle({
        Title = "Auto Clear World",
        Desc = "Bersihkan dari baris atas ke bawah",
        Value = false,
        Callback = function(_Fs)
            if _Fs then
                _kj.startClear()
            elseif _F.Running then
                _kf()
            end
        end,
    })
end)
_EI(function()
    _Fe.ClearSet:Dropdown({
        Title = "Arah sapu",
        Desc = "Zig-zag lebih cepat (tidak balik ke kiri)",
        Values = {"Kiri → Kanan", "Zig-zag"},
        Value = _F.Sweep,
        Callback = function(_Ft)
            _F.Sweep = _Ft
        end,
    })
end)
_EI(function()
    _Fe.ClearSet:Toggle({
        Title = "Pakai block pijakan",
        Desc = "Taruh block untuk lewat jurang / naik ke block melayang",
        Value = _F.UseBlock,
        Callback = function(_Fu)
            _F.UseBlock = _Fu
            _kj.resetReach()
        end,
    })
end)
_EI(function()
    _S.ClearBlockDropdown = _Fe.ClearSet:Dropdown({
        Title = "Block pijakan",
        Desc = "Block yang dipakai untuk pijakan",
        Values = {"(memuat...)"},
        Callback = function(_Fv)
            local _Fw = tonumber(string.match(_Fv or "", "%[(%d+)%]$"))
            if _Fw then
                _F.ScaffoldId = _Fw
                _kj.resetReach()
            end
        end,
    })
end)
_EI(function()
    _Fe.ClearSet:Toggle({
        Title = "Auto collect tiap habis pecah",
        Desc = "Ambil drop di sekitar karakter",
        Value = _F.Collect,
        Callback = function(_Fx)
            _F.Collect = _Fx
        end,
    })
end)
_EI(function()
    _Fe.ClearCtl:Button({
        Title = "Reset tile yang dilewati",
        Desc = "Coba lagi tile yang tadi gagal",
        Callback = function()
            table.clear(_F.Skip)
            table.clear(_kj.BadEdge)
            table.clear(_kj.ClearFail)
            _kj.updateClearStatus()
        end,
    })
end)
local _Fy = _ER("Farmer", "leaf", "farm")
_EI(function()
    _S.FarmerStatus = _Fy:Paragraph({Title = "Status Farmer", Desc = "-"})
end)
_Fe.FarmerCtl = _EY(_Fy, "Kontrol", true)
_Fe.FarmerSeed = _EY(_Fy, "Seed", true)
_Fe.FarmerSpeed = _EY(_Fy, "Kecepatan", false)
_Fe.FarmerBlock = _EY(_Fy, "Block pijakan", false)
_EI(function()
    _S.FarmerToggle = _Fe.FarmerCtl:Toggle({
        Title = "Jalankan Farmer",
        Desc = "Panen pohon siap & tanam seed otomatis",
        Value = false,
        Callback = function(_Fz)
            if _Fz then
                _kj.startFarmer()
            elseif _M.Running then
                _kg()
            end
        end,
    })
end)
_EI(function()
    _S.SeedDropdown = _Fe.FarmerSeed:Dropdown({
        Title = "Seed untuk ditanam",
        Desc = "Hanya seed yang ada di inventori",
        Values = {"(memuat...)"},
        Callback = function(_FA)
            local _FB = tonumber(string.match(_FA or "", "%[(%d+)%]$"))
            if _FB then
                _M.SeedId = _FB
                table.clear(_M.Skip)
                _kj.updateFarmerStatus()
            end
        end,
    })
end)
_EI(function()
    _Fe.FarmerSeed:Button({
        Title = "Refresh daftar seed",
        Callback = function()
            _eN(true)
        end,
    })
end)
_EI(function()
    _Fe.FarmerCtl:Toggle({
        Title = "Auto Harvest",
        Desc = "Hanya pohon yang sudah siap",
        Value = _M.Harvest,
        Callback = function(_FC)
            _M.Harvest = _FC
        end,
    })
end)
_EI(function()
    _Fe.FarmerCtl:Toggle({
        Title = "Auto Plant",
        Desc = "Tanam di atas block yang kosong",
        Value = _M.Plant,
        Callback = function(_FD)
            _M.Plant = _FD
        end,
    })
end)
_EI(function()
    _Fe.FarmerCtl:Toggle({
        Title = "Auto Collect",
        Desc = "Ambil hasil panen di sekitar karakter",
        Value = _M.Collect,
        Callback = function(_FE)
            _M.Collect = _FE
        end,
    })
end)
_Ff(_Fe.FarmerSpeed, {
    Title = "Speed Harvest (ms)",
    Desc = "Jeda setelah tiap panen",
    Min = 140,
    Max = 2000,
    Step = 10,
    Default = _M.HarvestMs,
    Callback = function(_FF)
        _M.HarvestMs = math.floor(_FF)
    end,
})
_Ff(_Fe.FarmerSpeed, {
    Title = "Speed Plant (ms)",
    Desc = "Jeda setelah tiap tanam seed",
    Min = 140,
    Max = 2000,
    Step = 10,
    Default = _M.PlantMs,
    Callback = function(_FG)
        _M.PlantMs = math.floor(_FG)
    end,
})
_EI(function()
    _Fe.FarmerBlock:Toggle({
        Title = "Pakai block pijakan",
        Desc = "Taruh block kalau tidak ada jalan (block tetap tertinggal)",
        Value = _M.UseBlock,
        Callback = function(_FH)
            _M.UseBlock = _FH
            _kj.resetReach()
        end,
    })
end)
_EI(function()
    _S.FarmerBlockDropdown = _Fe.FarmerBlock:Dropdown({
        Title = "Block pijakan",
        Desc = "Block yang dipakai untuk pijakan",
        Values = {"(memuat...)"},
        Callback = function(_FI)
            local _FJ = tonumber(string.match(_FI or "", "%[(%d+)%]$"))
            if _FJ then
                _M.ScaffoldId = _FJ
                _kj.resetReach()
            end
        end,
    })
end)
local _FK = _Fe.FarmSpeed
_EI(function()
    _FK:Dropdown({
        Title = "Mode",
        Desc = "Place semua tile dulu, lalu break",
        Values = {"Place + Break", "Break saja", "Place saja"},
        Value = _D.Mode,
        Callback = function(_FL)
            _D.Mode = _FL
        end,
    })
end)
_Ff(_FK, {
    Title = "Speed Place (ms)",
    Desc = "Jeda setelah tiap place",
    Min = 140,
    Max = 1000,
    Step = 10,
    Default = _D.PlaceMs,
    Callback = function(_FM)
        _D.PlaceMs = math.floor(_FM)
    end,
})
_Ff(_FK, {
    Title = "Speed Break (ms)",
    Desc = "Jeda tiap pukulan (normal 220). Dipakai juga Clear",
    Min = 200,
    Max = 1000,
    Step = 10,
    Default = _D.BreakMs,
    Callback = function(_FN)
        _D.BreakMs = math.floor(_FN)
    end,
})
_Ff(_FK, {
    Title = "Multi target break",
    Desc = ("Auto Farm: tile dipukul bergantian (seperti 2 jari). Pakai Rayma" .. "n's Fist = 2-3 tile segaris sekali pukul"),
    Min = 1,
    Max = 5,
    Step = 1,
    Default = _D.MultiTarget,
    Callback = function(_FO)
        _D.MultiTarget = math.clamp(math.floor(_FO), 1, 5)
    end,
})
_Ff(_FK, {
    Title = "Jeda setelah hancur (ms)",
    Desc = "Tunggu sebelum lanjut ke tile berikutnya",
    Min = 0,
    Max = 1500,
    Step = 50,
    Default = _D.AfterBreakMs,
    Callback = function(_FP)
        _D.AfterBreakMs = math.floor(_FP)
    end,
})
local _FQ = _ER("Pengaturan", "sliders-horizontal", "setel")
_Fe.SetChar = _EY(_FQ, "Karakter", true)
_Fe.SetOpt = _EY(_FQ, "Opsi", true)
local _FR = _Fe.SetOpt
_EI(function()
    _FR:Toggle({
        Title = "Mode Lite",
        Desc = "Matikan particle & suara (HP low-end)",
        Value = _D.LiteMode,
        Callback = function(_FS)
            _iq(_FS)
        end,
    })
end)
_EI(function()
    _FR:Toggle({
        Title = "Mute suara pukulan",
        Value = _D.MutePunch,
        Callback = function(_FT)
            _D.MutePunch = _FT
        end,
    })
end)
_EI(function()
    _FR:Toggle({
        Title = "Anti AFK",
        Value = _D.AntiAfk,
        Callback = function(_FU)
            _D.AntiAfk = _FU
        end,
    })
end)
_Ff(_FR, {
    Title = "Pukulan per block (cadangan)",
    Desc = "Dipakai kalau 'Pukul: TIDAK'. 0 = otomatis",
    Min = 0,
    Max = 20,
    Step = 1,
    Default = _D.HitsOverride,
    Callback = function(_FV)
        _D.HitsOverride = math.floor(_FV)
    end,
})
local _FW = _Fe.FarmBlock
_EI(function()
    _S.InvDropdown = _FW:Dropdown({
        Title = "Pilih Block",
        Desc = "Hanya item yang bisa di-place",
        Values = {"(memuat...)"},
        Callback = function(_FX)
            local _FY = tonumber(string.match(_FX or "", "%[(%d+)%]$"))
            if _FY then
                _D.SelectedId = _FY
                _id()
            end
        end,
    })
end)
_EI(function()
    _FW:Button({
        Title = "Refresh daftar",
        Callback = function()
            _eN(true)
        end,
    })
end)
local _FZ = _Fe.SetChar
_Ff(_FZ, {
    Title = "Walkspeed (%)",
    Desc = "100 = normal",
    Min = 50,
    Max = 500,
    Step = 10,
    Default = _E.Speed,
    Callback = function(_Ga)
        _iK(_Ga)
    end,
})
_EI(function()
    _FZ:Toggle({
        Title = "Infinite Jump",
        Desc = "Lompat di udara (bisa kena rollback)",
        Value = false,
        Callback = function(_Gb)
            _iG(_Gb)
        end,
    })
end)
_EI(function()
    _S.GhostToggle = _FZ:Toggle({
        Title = "Fly + Tembus Block",
        Desc = "Tembus block, pakai tombol ▲/▼ (bisa kena rollback)",
        Value = false,
        Callback = function(_Gc)
            _iI(_Gc)
        end,
    })
end)
local _Gd = _ER("Auto Chat", "message-circle", "fitur")
_EI(function()
    _S.SpamStatus = _Gd:Paragraph({Title = "Status Chat", Desc = "-"})
end)
_Fe.ChatCtl = _EY(_Gd, "Kontrol", true)
_Fe.ChatMsg = _EY(_Gd, "Pesan", true)
_EI(function()
    _Fe.ChatMsg:Input({
        Title = "Daftar pesan",
        Desc = "Pisahkan dengan |   contoh: halo|jual dirt",
        Value = table.concat(_O.Texts, "|"),
        Placeholder = "pesan 1|pesan 2|pesan 3",
        Callback = function(_Ge)
            _O.Texts = _Cq(_Ge)
            _O.Index = 1
            _Cv()
        end,
    })
end)
_Ff(_Fe.ChatMsg, {
    Title = "Interval (detik)",
    Desc = "Jeda antar pesan (min 3 detik)",
    Min = 3,
    Max = 120,
    Step = 1,
    Default = _O.IntervalSec,
    Callback = function(_Gf)
        _O.IntervalSec = math.max(3, math.floor(_Gf))
    end,
})
_EI(function()
    _S.SpamToggle = _Fe.ChatCtl:Toggle({
        Title = "Auto Chat",
        Desc = "Kirim pesan bergantian sesuai urutan",
        Value = false,
        Callback = function(_Gg)
            _O.On = _Gg
            if _Gg then
                if #_O.Texts == 0 then
                    _bH("Auto Chat", "Isi daftar pesan dulu (tekan Enter setelah mengetik)", 4)
                end
                _O.NextAt = 0
            end
            _Cv()
        end,
    })
end)
_EI(function()
    _Fe.ChatCtl:Button({
        Title = "Kirim 1 pesan sekarang",
        Desc = "Tes kirim pesan berikutnya",
        Callback = function()
            task.spawn(function()
                _Cx()
                _Cv()
            end)
        end,
    })
end)

local function _Gh()
    local _Gi, _Gj = {"none"}, {none = true}
    if _y and type(_z) == "table" and type(_z.titlesOf) == "function" then
        local _Gk, _Gl = pcall(_z.titlesOf, _k.UserId)
        if _Gk and type(_Gl) == "table" then
            for _Gm, _Gn in ipairs(_Gl) do
                if type(_Gn) == "string" and not _Gj[_Gn] then
                    _Gj[_Gn] = true
                    local _Go = _Gn
                    if type(_z.titleName) == "function" then
                        local _Gp, _Gq = pcall(_z.titleName, _Gn)
                        if _Gp and type(_Gq) == "string" and _Gq ~= "" and _Gq ~= _Gn then
                            _Go = _Gq .. " [" .. _Gn .. "]"
                        end
                    end
                    table.insert(_Gi, _Go)
                end
            end
        end
    end
    return _Gi
end

local function _Gr(_Gs)
    return string.match(_Gs or "", "%[(.-)%]$") or _Gs
end

local function _Gt()
    if _S.RoleDropdown then
        pcall(function()
            _S.RoleDropdown:Refresh(_Gh())
        end)
    end
end
local _Gu = _ER("Staff", "user-cog", "aman")
_EI(function()
    _Gu:Button({
        Title = "Buka Staff Backpack",
        Desc = "UI staff bawaan game (dikunci server)",
        Callback = function()
            if _P.Menu and type(_P.Menu.openBackpack) == "function" then
                local _Gv = {name = _k.DisplayName or _k.Name, userId = _k.UserId}
                local _Gw, _Gx = pcall(_P.Menu.openBackpack, _Gv)
                if not _Gw then
                    _bH("Staff", "Gagal buka: " .. tostring(_Gx), 4)
                end
            else
                _bH("Staff", "Menu game belum ketemu. Tekan 'Hubungkan ke game' dulu", 4)
            end
        end,
    })
end)
_EI(function()
    _S.RoleDropdown = _Gu:Dropdown({
        Title = "Role / Title",
        Desc = "Title yang kamu punya",
        Values = {"none"},
        Callback = function(_Gy)
            _D.Role = _Gr(_Gy)
        end,
    })
end)
_EI(function()
    _Gu:Button({Title = "Refresh daftar role", Callback = _Gt,})
end)
_EI(function()
    _Gu:Button({
        Title = "Pakai Role",
        Desc = "Sama seperti menu Title game",
        Callback = function()
            local _Gz = (_D.Role ~= "" and _D.Role) or "none"
            if _r and type(_s) == "table" and type(_s.call) == "function" then
                task.spawn(function()
                    local _GA, _GB = pcall(_s.call, "PickTitle", _Gz)
                    _bH("Staff", _GA and ("Role dikirim: " .. _Gz) or ("Gagal: " .. tostring(_GB)), 4)
                end)
            else
                local _GC = _n:FindFirstChild("PickTitle")
                if _GC then
                    pcall(function()
                        _GC:FireServer(_Gz)
                    end)
                    _bH("Staff", "Role dikirim: " .. _Gz)
                else
                    _bH("Staff", "Fungsi PickTitle tidak ada")
                end
            end
        end,
    })
end) do
    (function()
        local function _GD(_GE)
            return (tostring(_GE or ""):gsub("`.", ""))
        end
        local function _GF(_GG)
            if not (_y and type(_z) == "table") then
                return nil
            end
            local _GH, _GI = pcall(_z.isDeveloper, _GG)
            if _GH and _GI then
                return "Developer"
            end
            local _GJ, _GK = pcall(_z.isModerator, _GG)
            if _GJ and _GK then
                return "Moderator"
            end
            return nil
        end
        local function _GL()
            local _GM = _P.World and rawget(_P.World, "name")
            return type(_GM) == "string" and _GM or ""
        end
        local function _GN()
            local _GO = {}
            local _GP = _P.Others
            if not _GP or type(rawget(_GP, "list")) ~= "function" then
                return _GO
            end
            local _GQ, _GR = pcall(_GP.list)
            if not _GQ or type(_GR) ~= "table" then
                return _GO
            end
            for _GS, _GT in ipairs(_GR) do
                local _GU = type(_GT) == "table" and tonumber(_GT[1] or _GT.userId)
                if _GU and _GU ~= _k.UserId then
                    _GO[#_GO + 1] = {id = _GU, name = _GD(_GT[2] or _GT.name or _GU), role = _GF(_GU)}
                end
            end
            return _GO
        end
        _L.playersHere = _GN
        local function _GV(_GW)
            local _GX = {}
            for _GY, _GZ in ipairs(_GW) do
                if _GZ.role or (_L.Who == "Semua pemain" and not _L.Allow[_GZ.id]) then
                    _GX[#_GX + 1] = _GZ
                end
            end
            return _GX
        end
        local function _Ha(_Hb)
            local _Hc = false
            if _Hb.role and type(_z.isUndercover) == "function" then
                local _Hd, _He = pcall(_z.isUndercover, _Hb.id)
                _Hc = _Hd and _He == true
            end
            return _Hb.name .. " (" .. (_Hb.role or "Pemain") .. (_Hc and ", undercover" or "") .. ")"
        end
        local function _Hf(_Hg, _Hh)
            local _Hi = {}
            for _Hj, _Hk in ipairs(_Hg) do
                if _Hj > (_Hh or 4) then
                    _Hi[#_Hi + 1] = "+" .. (#_Hg - _Hj + 1) .. " lagi"
                    break
                end
                _Hi[#_Hi + 1] = _Ha(_Hk)
            end
            return table.concat(_Hi, ", ")
        end
        local function _Hl()
            return _D.Running or _F.Running or _M.Running or _H.Running or _O.On or _K.Running or _J.Running
        end
        local function _Hm()
            local _Hn, _Ho = _kj.here()
            return {
                farm = _D.Running and not _D.Override,
                clear = _F.Running,
                farmer = _M.Running,
                spam = _O.On,
                splice = _H.Running,
                pabrik = _K.Running,
                build = _J.Running,
                world = _GL(),
                tx = _Hn,
                ty = _Ho,
            }
        end
        local function _Hp()
            _kj.stopWalk()
            if _K.Running then
                _K.stop()
            end
            if _J.Running then
                _J.stop()
            end
            if _D.Running then
                _iR()
            end
            if _F.Running then
                _kf()
                _F.Status = "Dijeda Penjaga"
            end
            if _M.Running then
                _kg()
                _M.Status = "Dijeda Penjaga"
            end
            if _H.Running and _H.stop then
                _H.stop()
            end
            if _O.On then
                _O.On = false
                if _S.SpamToggle then
                    pcall(function()
                        _S.SpamToggle:Set(false)
                    end)
                end
            end
            _kj.releaseInput()
        end
        local function _Hq()
            local _Hr = _P.Menu
            if _Hr and type(rawget(_Hr, "openPicker")) == "function" and pcall(_Hr.openPicker) then
                return true
            end
            local _Hs = _P.World
            if _Hs and type(rawget(_Hs, "call")) == "function" then
                return (pcall(_Hs.call, "LeaveWorld"))
            end
            return false
        end
        local function _Ht(_Hu)
            local _Hv = _P.World
            if not _Hv or _Hu == "" then
                return false, "nama world tidak diketahui"
            end
            local _Hw = rawget(_Hv, "fg")
            local _Hx = _P.Menu
            if _Hx and type(rawget(_Hx, "enter")) == "function" then
                pcall(_Hx.enter, _Hu)
            elseif type(rawget(_Hv, "enter")) == "function" then
                local _Hy, _Hz, _HA = pcall(_Hv.enter, _Hu)
                if _Hy and not _Hz then
                    return false, _GD(_HA)
                end
            else
                return false, "fungsi masuk world tidak ketemu"
            end
            local _HB = os.clock()
            while _e() and os.clock() - _HB < 8 do
                if rawget(_Hv, "fg") ~= _Hw then
                    return true
                end
                task.wait(0.25)
            end
            return false, "world penuh / dikunci / gagal"
        end
        local function _HC(_HD)
            return _e() and _L.Token == _HD and _L.Mode == "back"
        end
        local function _HE(_HF, _HG)
            if not _HF then
                return
            end
            if _HF.world ~= "" and _GL() ~= _HF.world then
                _bH("Penjaga", "World sudah beda, aktivitas tidak dilanjutkan", 5)
                return
            end
            if _HF.spam and not _O.On and _HC(_HG) then
                if _S.SpamToggle then
                    pcall(function()
                        _S.SpamToggle:Set(true)
                    end)
                end
                _O.On = true
            end
            if _HF.build then
                if _HC(_HG) then
                    _J.start()
                end
            elseif _HF.pabrik then
                if _HC(_HG) then
                    _K.start()
                end
            elseif _HF.farm then
                local _HH, _HI = _kj.here()
                if _HF.tx and (_HH ~= _HF.tx or _HI ~= _HF.ty) then
                    _L.BackText = ("Jalan balik ke posisi farm (%d,%d)"):format(_HF.tx, _HF.ty)
                    local _HJ = _kj.walkTo(_HF.tx, _HF.ty, 45)
                    if not _HJ and _HC(_HG) then
                        _HJ = _kj.walkTo(_HF.tx, _HF.ty, 30)
                    end
                    if not _HJ then
                        if _HC(_HG) then
                            _bH("Penjaga", "Gagal balik ke posisi farm. Auto Farm tidak dilanjutkan", 6)
                        end
                        return
                    end
                end
                if _HC(_HG) then
                    _kh()
                end
            elseif _HF.clear then
                if _HC(_HG) then
                    _kj.startClear()
                end
            elseif _HF.farmer then
                if _HC(_HG) then
                    _kj.startFarmer()
                end
            elseif _HF.splice then
                if _HC(_HG) and _H.start then
                    _H.start()
                end
            end
        end
        local function _HK()
            local _HL = _L.Saved
            _L.Token += 1
            local _HM = _L.Token
            _L.Mode = "back"
            _L.BackText = nil
            task.spawn(function()
                local _HN, _HO = pcall(_HE, _HL, _HM)
                if not _HN then
                    warn("[Noxablox] Penjaga lanjut error: " .. tostring(_HO))
                end
                if _L.Token == _HM and _L.Mode == "back" then
                    _L.Mode, _L.Saved, _L.BackText = "idle", nil, nil
                end
            end)
        end
        local function _HP()
            if not _Hq() then
                _bH("Penjaga", "Gagal keluar world, aktivitas hanya dijeda", 5)
                _L.Mode = "pause"
                return
            end
            task.wait(0.3)
            _L.LeftFg = _P.World and rawget(_P.World, "fg")
            _L.BackAt = os.clock() + _L.BackSec
            _L.Mode = _L.AutoBack and "away" or "out"
            _L.Status = "Keluar world"
        end
        local function _HQ(_HR)
            _L.Detected += #_HR
            _bH("Penjaga", "Masuk world: " .. _Hf(_HR), 6)
            _cz.send("penjaga", "Masuk world " .. _GL() .. ": " .. _Hf(_HR))
            if not _L.StopAll and not _L.Leave then
                return
            end
            if _L.Mode ~= "back" and (_Hl() or not _L.Saved) then
                _L.Saved = _Hm()
            end
            _L.Token += 1
            _Hp()
            _L.CalmAt = nil
            if _L.Leave then
                _HP()
                if _L.Mode == "away" then
                    _bH("Penjaga", "Keluar world. Masuk lagi dalam " .. _L.BackSec .. " detik", 5)
                    _cz.send("penjaga", "Keluar world, masuk lagi dalam " .. _L.BackSec .. " detik")
                elseif _L.Mode == "out" then
                    _bH("Penjaga", "Keluar world", 4)
                end
            else
                _L.Mode = "pause"
            end
        end
        local function _HS()
            _kj.resetReach()
            pcall(_gJ)
            pcall(_kj.findTreeRefs)
            table.clear(_R)
            task.wait(1.5)
            local _HT = _GV(_GN())
            if #_HT > 0 then
                for _HU, _HV in ipairs(_HT) do
                    _L.Alerted[_HV.id] = true
                end
                _bH("Penjaga", "Masih ada " .. _Hf(_HT) .. ". Keluar lagi", 5)
                _HP()
                return
            end
            _bH("Penjaga", "World aman, lanjut aktivitas", 4)
            _cz.send("penjaga", "World " .. _GL() .. " aman, lanjut aktivitas")
            _HK()
        end
        local _HW, _HX = -10, "-"
        local function _HY()
            if os.clock() - _HW < 3 then
                return _HX
            end
            _HW = os.clock()
            local _HZ = {}
            for _Ia, _Ib in ipairs(_f:GetPlayers()) do
                if _Ib ~= _k then
                    local _Ic = _GF(_Ib.UserId)
                    if _Ic then
                        _HZ[#_HZ + 1] = (_Ib.DisplayName or _Ib.Name) .. " (" .. _Ic .. ")"
                    end
                end
            end
            _HX = (#_HZ > 0) and table.concat(_HZ, ", ") or "tidak ada"
            return _HX
        end
        function _L.tick(_Id)
            if not _L.On then
                _L.Status = "Mati"
                return
            end
            local _Ie = os.clock()
            local _If = _L.Mode
            if _If == "away" or _If == "out" then
                local _Ig = _P.World and rawget(_P.World, "fg")
                if _L.LeftFg and _Ig ~= _L.LeftFg then
                    if _If == "away" and _L.Saved and _GL() == _L.Saved.world then
                        _HS()
                    else
                        _L.Mode, _L.Saved = "idle", nil
                    end
                    return
                end
                local _Ih = _L.Saved and _L.Saved.world or ""
                if _If == "out" or _Ih == "" then
                    _L.Status = "Sudah keluar world (lanjut otomatis mati)"
                    return
                end
                local _Ii = _L.BackAt - _Ie
                if _Ii > 0 then
                    _L.Status = ("Di luar world. Masuk lagi ke %s dalam %d detik"):format(_Ih, math.ceil(_Ii))
                    return
                end
                _L.Status = "Masuk lagi ke " .. _Ih .. "..."
                _L.updateStatus({})
                local _Ij, _Ik = _Ht(_Ih)
                if not _Ij then
                    _L.BackAt = os.clock() + math.max(15, _L.BackSec)
                    _bH("Penjaga", "Gagal masuk " .. _Ih .. ": " .. tostring(_Ik) .. ". Dicoba lagi nanti", 5)
                    return
                end
                _HS()
                return
            end
            local _Il = {}
            for _Im, _In in ipairs(_Id) do
                _Il[_In.id] = true
            end
            for _Io in pairs(_L.Alerted) do
                if not _Il[_Io] then
                    _L.Alerted[_Io] = nil
                end
            end
            local _Ip = _GV(_Id)
            local _Iq = {}
            for _Ir, _Is in ipairs(_Ip) do
                if not _L.Alerted[_Is.id] then
                    _L.Alerted[_Is.id] = true
                    _Iq[#_Iq + 1] = _Is
                end
            end
            if #_Iq > 0 then
                _HQ(_Iq)
                if _L.Mode == "away" or _L.Mode == "out" then
                    return
                end
            end
            if #_Ip > 0 then
                _L.CalmAt = nil
                _L.Status = (_L.Mode == "pause" and "Dijeda. Ada: " or "Waspada. Ada: ") .. _Hf(_Ip)
                return
            end
            if _L.Mode == "pause" then
                _L.CalmAt = _L.CalmAt or _Ie
                local _It = _L.CalmSec - (_Ie - _L.CalmAt)
                if _It > 0 then
                    _L.Status = ("Mereka sudah pergi. Lanjut dalam %d detik"):format(math.ceil(_It))
                    return
                end
                _L.CalmAt = nil
                if _L.AutoBack and _L.Saved then
                    _bH("Penjaga", "Sudah aman, lanjut aktivitas", 4)
                    _HK()
                else
                    _L.Mode, _L.Saved = "idle", nil
                end
                return
            end
            if _L.Mode == "back" then
                _L.Status = _L.BackText or "Lanjut aktivitas..."
                return
            end
            _L.Status = "Aman"
        end
        function _L.updateStatus(_Iu)
            local _Iv = table.concat({
                "Status: " .. _L.Status .. (_P.Others and "" or " (data pemain belum ketemu: tekan 'Hubungkan ke game')"),
                "Pemain di world: " .. ((#_Iu == 0) and "tidak ada" or _Hf(_Iu, 6)),
                "Staff online di server: " .. _HY(),
                "Terdeteksi: " .. _L.Detected .. " kali",
            }, "\n")
            if _Iv ~= _L.LastTxt then
                _L.LastTxt = _Iv
                if _S.GuardStatus then
                    pcall(function()
                        _S.GuardStatus:SetDesc(_Iv)
                    end)
                end
            end
        end
        function _L.set(_Iw)
            _L.On = _Iw
            _L.Token += 1
            _kj.stopWalk()
            _L.Mode, _L.Saved, _L.CalmAt, _L.BackText = "idle", nil, nil, nil
            table.clear(_L.Alerted)
            table.clear(_L.Allow)
            if _Iw then
                for _Ix, _Iy in ipairs(_GN()) do
                    if not _Iy.role then
                        _L.Allow[_Iy.id] = true
                    end
                end
            end
        end
        _L.snapshot = _Hm
        _L.stopAll = _Hp
        _L.enterWorld = _Ht
        _L.leaveWorld = _Hq
        _L.worldName = _GL
        _L.anyRunning = _Hl
        function _L.afterEnter()
            _kj.resetReach()
            pcall(_gJ)
            pcall(_kj.findTreeRefs)
            table.clear(_R)
        end
        function _L.resumeSaved(_Iz)
            _L.Saved = _Iz
            _HK()
        end
        function _L.allowNow()
            local _IA = 0
            for _IB, _IC in ipairs(_GN()) do
                if not _IC.role then
                    _L.Allow[_IC.id] = true
                    _IA += 1
                end
            end
            return _IA
        end
        task.spawn(function()
            while _e() do
                local _ID = (_L.Mode ~= "away" and _L.Mode ~= "out") and _GN() or {}
                local _IE, _IF = pcall(_L.tick, _ID)
                if not _IE then
                    warn("[Noxablox] Penjaga error: " .. tostring(_IF))
                end
                _L.updateStatus(_ID)
                task.wait(0.5)
            end
        end)
    end)()
end
_bL.add("Penjaga", _L, {"On", "Who", "StopAll", "Leave", "AutoBack", "BackSec", "CalmSec"}, {On = true}) do
    (function()
        local _IG = _ER("Penjaga", "eye", "aman")
        _EI(function()
            _S.GuardStatus = _IG:Paragraph({Title = "Status Penjaga", Desc = "Mati"})
        end)
        local _IH = _EY(_IG, "Kontrol", true)
        local _II = _EY(_IG, "Aksi saat terdeteksi", true)
        local _IJ = _EY(_IG, "Waktu", false)
        local _IK = _EY(_IG, "Lainnya", false)
        _EI(function()
            _S.GuardToggle = _IH:Toggle({
                Title = "Aktifkan Penjaga",
                Desc = "Pantau Mod / Dev / pemain yang masuk world",
                Value = false,
                Callback = function(_IL)
                    _L.set(_IL)
                end,
            })
        end)
        _EI(function()
            _IH:Dropdown({
                Title = "Yang dideteksi",
                Desc = "Semua pemain: yang sudah ada saat dinyalakan diabaikan",
                Values = {"Staff (Mod/Dev)", "Semua pemain"},
                Value = _L.Who,
                Callback = function(_IM)
                    _L.Who = _IM
                end,
            })
        end)
        _EI(function()
            _II:Toggle({
                Title = "Diam semua aktivitas",
                Desc = "Stop Auto Farm, Clear, Farmer & Auto Chat",
                Value = _L.StopAll,
                Callback = function(_IN)
                    _L.StopAll = _IN
                end,
            })
        end)
        _EI(function()
            _II:Toggle({
                Title = "Keluar world",
                Desc = "Langsung keluar world saat terdeteksi",
                Value = _L.Leave,
                Callback = function(_IO)
                    _L.Leave = _IO
                end,
            })
        end)
        _EI(function()
            _II:Toggle({
                Title = "Lanjut otomatis setelah aman",
                Desc = "Keluar world: masuk lagi, cek, lalu lanjut aktivitas sebelumnya",
                Value = _L.AutoBack,
                Callback = function(_IP)
                    _L.AutoBack = _IP
                end,
            })
        end)
        _Ff(_IJ, {
            Title = "Masuk world lagi setelah (detik)",
            Desc = "Untuk mode keluar world",
            Min = 20,
            Max = 600,
            Step = 5,
            Default = _L.BackSec,
            Callback = function(_IQ)
                _L.BackSec = math.floor(_IQ)
            end,
        })
        _Ff(_IJ, {
            Title = "Tunggu aman (detik)",
            Desc = "Untuk mode diam: jeda setelah mereka pergi",
            Min = 2,
            Max = 60,
            Step = 1,
            Default = _L.CalmSec,
            Callback = function(_IR)
                _L.CalmSec = math.floor(_IR)
            end,
        })
        _EI(function()
            _IK:Button({
                Title = "Abaikan pemain yang ada sekarang",
                Desc = "Untuk teman / akun sendiri (staff tetap dideteksi)",
                Callback = function()
                    _bH("Penjaga", _L.allowNow() .. " pemain diabaikan", 3)
                end,
            })
        end)
        _EI(function()
            _IK:Button({
                Title = "Batalkan tunggu / lanjut",
                Desc = "Hentikan proses keluar-masuk & lanjut otomatis",
                Callback = function()
                    _L.set(_L.On)
                    _bH("Penjaga", "Dibatalkan", 3)
                end,
            })
        end)
    end)()
end
local _IS = {
    Quest = false,
    Redeem = false,
    QuestEvery = 30,
    CodeEvery = 300,
    NextQuest = 0,
    NextCode = 0,
    Claimed = 0,
    Redeemed = 0,
    Tried = {},
    QuestFail = {},
    QuestText = "-",
    CodeText = "-",
    ResetAt = nil,
} do
    (function()
        local function _IT(_IU)
            return (tostring(_IU or ""):gsub("`.", ""))
        end
        local function _IV(...)
            if _r and type(_s) == "table" and type(_s.call) == "function" then
                return pcall(_s.call, ...)
            end
            return false, "Net.call tidak ada"
        end
        local function _IW(_IX)
            _IX = math.max(0, math.floor(_IX or 0))
            if _IX >= 3600 then
                return ("%dj %dm"):format(_IX // 3600, _IX % 3600 // 60)
            end
            return ("%dm %dd"):format(_IX // 60, _IX % 60)
        end
        local function _IY(_IZ)
            local _Ja = _P.Gems
            if type(_IZ) == "number" and _Ja and type(rawget(_Ja, "setGems")) == "function" then
                pcall(_Ja.setGems, _IZ)
            end
        end
        function _IS.checkQuests()
            if _IS.BusyQ then
                return
            end
            _IS.BusyQ = true
            local _Jb, _Jc, _Jd = _IV("Quests", "list")
            if not _Jb then
                _IS.QuestText = "Gagal ambil quest: " .. _IT(_Jc)
            elseif not _Jc or type(_Jd) ~= "table" or type(_Jd.quests) ~= "table" then
                _IS.QuestText = "Quest belum bisa diambil" .. (type(_Jd) == "string" and (": " .. _IT(_Jd)) or "")
            else
                local _Je, _Jf, _Jg = 0, 0, 0
                local _Jh = os.clock()
                for _Ji, _Jj in ipairs(_Jd.quests) do
                    _Je += 1
                    local _Jk, _Jl = tonumber(_Jj.have) or 0, tonumber(_Jj.need) or math.huge
                    if _Jj.claimed then
                        _Jf += 1
                    elseif _Jk >= _Jl and not ((_IS.QuestFail[_Jj.id] or 0) > _Jh) then
                        local _Jm, _Jn, _Jo, _Jp, _Jq = _IV("Quests", "claim", _Jj.id)
                        if _Jm and _Jn then
                            _Jf += 1
                            _IS.Claimed += 1
                            local _Jr = _Jj.xp and (tostring(_Jj.reward) .. " XP") or (tostring(_Jj.reward) .. " gems")
                            _bH("Quest diklaim", _IT(_Jj.text or _Jj.id) .. "  +" .. _Jr, 4)
                            _cz.send("bonus", "Quest diklaim: " .. _IT(_Jj.text or _Jj.id) .. " +" .. _Jr)
                            _IY(_Jq)
                        else
                            _Jg += 1
                            _IS.QuestFail[_Jj.id] = _Jh + 120
                            if _Jm and _Jo then
                                _IS.LastQuestMsg = _IT(_Jo)
                            end
                        end
                        task.wait(0.6)
                    elseif _Jk >= _Jl then
                        _Jg += 1
                    end
                end
                _IS.ResetAt = os.clock() + (tonumber(_Jd.resetIn) or 0)
                _IS.QuestText = ("Selesai %d/%d | diklaim script: %d"):format(_Jf, _Je, _IS.Claimed) .. ((_Jg > 0) and (" | ditolak: " .. _Jg) or "")
            end
            _IS.BusyQ = false
        end
        function _IS.redeem(_Js)
            local _Jt, _Ju = _IV("ModCommand", "redeemcode", _Js)
            if not _Jt then
                return nil, "tidak bisa ke server"
            end
            local _Jv = type(_Ju) == "table" and type(_Ju.lines) == "table" and _Ju.lines or nil
            if not _Jv then
                return false, "balasan kosong"
            end
            local _Jw = tostring(_Jv[1] or "")
            local _Jx = {}
            for _Jy, _Jz in ipairs(_Jv) do
                _Jx[#_Jx + 1] = _IT(_Jz)
            end
            return string.sub(_Jw, 1, 2) == "`2", table.concat(_Jx, " ")
        end
        function _IS.checkCodes()
            if _IS.BusyR then
                return
            end
            _IS.BusyR = true
            local _JA, _JB = _IV("ActiveCodes")
            if not _JA or type(_JB) ~= "table" then
                _IS.CodeText = "Gagal ambil daftar code"
            elseif _JB.note ~= nil then
                _IS.CodeText = "Redeem sedang ditutup: " .. _IT(_JB.note)
            else
                local _JC, _JD, _JE = 0, 0, 0
                for _JF, _JG in ipairs(_JB) do
                    _JC += 1
                    local _JH = _JG.code and tostring(_JG.code)
                    if _JG.done then
                        _JD += 1
                    elseif _JH and not _IS.Tried[_JH] and not (type(_JG.uses) == "number" and _JG.uses == 0) then
                        local _JI, _JJ = _IS.redeem(_JH)
                        if _JI ~= nil then
                            _IS.Tried[_JH] = true
                        end
                        if _JI then
                            _JD += 1
                            _JE += 1
                            _IS.Redeemed += 1
                            _bH("Redeem berhasil", _JH .. ": " .. tostring(_JJ), 5)
                            _cz.send("bonus", "Redeem berhasil " .. _JH .. ": " .. tostring(_JJ))
                        elseif _JI == false then
                            _IS.LastCodeMsg = _JH .. ": " .. tostring(_JJ)
                        end
                        task.wait(1)
                    end
                end
                _IS.CodeText = ("Code aktif: %d | sudah ditukar: %d | ditukar script: %d"):format(_JC, _JD, _IS.Redeemed)
            end
            _IS.BusyR = false
        end
        function _IS.updateStatus()
            local _JK = os.clock()
            local _JL = _IS.QuestText
            if _IS.ResetAt then
                _JL = _JL .. "\nQuest baru dalam " .. _IW(_IS.ResetAt - _JK)
            end
            if _IS.LastQuestMsg then
                _JL = _JL .. "\nPesan terakhir: " .. _IS.LastQuestMsg
            end
            _JL = _JL .. "\n" .. (_IS.Quest and ("Cek lagi dalam " .. math.max(0, math.ceil(_IS.NextQuest - _JK)) .. " detik") or "Auto klaim mati")
            local _JM = _IS.CodeText
            if _IS.LastCodeMsg then
                _JM = _JM .. "\nPesan terakhir: " .. _IS.LastCodeMsg
            end
            _JM = _JM .. "\n" .. (_IS.Redeem and ("Cek lagi dalam " .. _IW(_IS.NextCode - _JK)) or "Auto redeem mati")
            if _S.QuestStatus then
                pcall(function()
                    _S.QuestStatus:SetDesc(_JL)
                end)
            end
            if _S.CodeStatus then
                pcall(function()
                    _S.CodeStatus:SetDesc(_JM)
                end)
            end
        end
        task.spawn(function()
            while _e() do
                local _JN = os.clock()
                if _IS.Quest and _JN >= _IS.NextQuest then
                    _IS.NextQuest = _JN + _IS.QuestEvery
                    pcall(_IS.checkQuests)
                end
                if _IS.Redeem and _JN >= _IS.NextCode then
                    _IS.NextCode = _JN + _IS.CodeEvery
                    pcall(_IS.checkCodes)
                end
                _IS.updateStatus()
                task.wait(1)
            end
        end)
    end)()
end
_bL.add("Bonus", _IS, {"Quest", "Redeem"}) do
    (function()
        local _JO = _ER("Bonus", "gift", "fitur")
        local _JP = _EY(_JO, "Quest Harian", true)
        local _JQ = _EY(_JO, "Redeem Code", true)
        _EI(function()
            _S.QuestStatus = _JP:Paragraph({Title = "Status", Desc = "-"})
        end)
        _EI(function()
            _JP:Toggle({
                Title = "Auto Claim Quest",
                Desc = "Klaim hadiah quest yang sudah selesai",
                Value = _IS.Quest,
                Callback = function(_JR)
                    _IS.Quest = _JR
                    if _JR then
                        _IS.NextQuest = 0
                    end
                end,
            })
        end)
        _EI(function()
            _JP:Button({
                Title = "Cek quest sekarang",
                Callback = function()
                    task.spawn(_IS.checkQuests)
                end,
            })
        end)
        _EI(function()
            _S.CodeStatus = _JQ:Paragraph({Title = "Status", Desc = "-"})
        end)
        _EI(function()
            _JQ:Toggle({
                Title = "Auto Redeem Code",
                Desc = "Tukar semua code aktif yang belum dipakai",
                Value = _IS.Redeem,
                Callback = function(_JS)
                    _IS.Redeem = _JS
                    if _JS then
                        _IS.NextCode = 0
                    end
                end,
            })
        end)
        _EI(function()
            _JQ:Button({
                Title = "Cek code sekarang",
                Callback = function()
                    table.clear(_IS.Tried)
                    task.spawn(_IS.checkCodes)
                end,
            })
        end)
        _EI(function()
            _JQ:Input({
                Title = "Redeem code manual",
                Desc = "Ketik code lalu tekan Enter",
                Value = "",
                Placeholder = "KODE",
                Callback = function(_JT)
                    local _JU = tostring(_JT or ""):gsub("^%s+", ""):gsub("%s+$", "")
                    if _JU == "" then
                        return
                    end
                    task.spawn(function()
                        local _JV, _JW = _IS.redeem(_JU)
                        if _JV then
                            _IS.Redeemed += 1
                        end
                        _bH(_JV and "Redeem berhasil" or "Redeem gagal", _JU .. ": " .. tostring(_JW), 5)
                    end)
                end,
            })
        end)
    end)()
end
local _JX = {Auto = false, Layer = "Semua", Filter = "", Every = 2, Limit = 60, Last = nil,} do
    (function()
        local function _JY(_JZ)
            local _Ka = tostring(math.floor(_JZ))
            local _Kb = _Ka:reverse():gsub("(%d%d%d)", "%1."):reverse()
            return (_Kb:gsub("^%.", ""))
        end
        local function _Kc(_Kd)
            local _Ke = _p[_Kd]
            local _Kf = _dM(_Kd)
            if _Ke and _Ke.kind == "seed" then
                _Kf = _Kf .. " (pohon)"
            end
            return _Kf
        end
        local function _Kg(_Kh, _Ki)
            local _Kj = {}
            for _Kk, _Kl in pairs(_Kh) do
                _Kj[#_Kj + 1] = {id = _Kk, n = _Kl}
            end
            table.sort(_Kj, function(_Km, _Kn)
                if _Km.n ~= _Kn.n then
                    return _Km.n > _Kn.n
                end
                return _Km.id < _Kn.id
            end)
            local _Ko = string.lower(_JX.Filter or "")
            local _Kp, _Kq = {}, 0
            for _Kr, _Ks in ipairs(_Kj) do
                local _Kt = _Ki(_Ks.id)
                if _Ko == "" or string.find(string.lower(_Kt), _Ko, 1, true) then
                    _Kq += 1
                    if _Kq <= _JX.Limit then
                        _Kp[#_Kp + 1] = _Kt .. "  x" .. _JY(_Ks.n)
                    end
                end
            end
            if _Kq > _JX.Limit then
                _Kp[#_Kp + 1] = ("... +%d item lain (pakai Cari item)"):format(_Kq - _JX.Limit)
            end
            if #_Kp == 0 then
                _Kp[1] = (_Ko ~= "") and "Tidak ada yang cocok" or "Kosong"
            end
            return table.concat(_Kp, "\n"), _Kq
        end
        local function _Ku()
            local _Kv, _Kw, _Kx = {}, 0, 0
            local _Ky = _Q.list
            if type(_Ky) ~= "table" then
                return nil
            end
            for _Kz, _KA in pairs(_Ky) do
                if type(_KA) == "table" and type(_KA.id) == "number" then
                    local _KB = tonumber(_KA.n) or 1
                    if _KB > 0 then
                        _Kv[_KA.id] = (_Kv[_KA.id] or 0) + _KB
                        _Kw += _KB
                        _Kx += 1
                    end
                end
            end
            return _Kv, _Kw, _Kx
        end
        local function _KC()
            local _KD = _P.World
            if not _KD or type(_KD.fg) ~= "table" or type(_KD.w) ~= "number" then
                return nil
            end
            local _KE, _KF, _KG, _KH = {}, {}, 0, 0
            local _KI = {}
            local _KJ = workspace:GetServerTimeNow()
            local _KK = _kj.treeReadyAt
            for _KL = 0, _KD.h - 1 do
                local _KM = _KD.fg[_KL]
                local _KN = _KD.bg and _KD.bg[_KL]
                for _KO = 0, _KD.w - 1 do
                    local _KP = _KM and _KM[_KO] or 0
                    if _KP ~= 0 then
                        _KE[_KP] = (_KE[_KP] or 0) + 1
                        _KG += 1
                        local _KQ = _p[_KP]
                        if _KK and _KQ and _KQ.kind == "seed" then
                            local _KR = _KK(_KO, _KL, _KP)
                            if _KR then
                                local _KS = _KI[_KP]
                                if not _KS then
                                    _KS = {r = 0, g = 0}
                                    _KI[_KP] = _KS
                                end
                                if _KJ >= _KR then
                                    _KS.r += 1
                                else
                                    _KS.g += 1
                                    if not _KS.nxt or _KR - _KJ < _KS.nxt then
                                        _KS.nxt = _KR - _KJ
                                    end
                                end
                            end
                        end
                    end
                    local _KT = _KN and _KN[_KO] or 0
                    if _KT ~= 0 then
                        _KF[_KT] = (_KF[_KT] or 0) + 1
                        _KH += 1
                    end
                end
                if _KL % 64 == 63 then
                    task.wait()
                end
            end
            return _KE, _KF, _KG, _KH, _KI
        end
        local function _KU(_KV)
            _KV = math.max(0, math.floor(_KV or 0))
            if _KV >= 3600 then
                return ("%dj %dm"):format(_KV // 3600, _KV % 3600 // 60)
            end
            return ("%dm %dd"):format(_KV // 60, _KV % 60)
        end
        local function _KW(_KX)
            local _KY, _KZ, _La = {}, 0, 0
            local _Lb = string.lower(_JX.Filter or "")
            for _Lc, _Ld in pairs(_KX) do
                _KZ += _Ld.r
                _La += _Ld.g
                local _Le = _dM(_Lc)
                if _Lb == "" or string.find(string.lower(_Le), _Lb, 1, true) then
                    _KY[#_KY + 1] = {name = _Le, e = _Ld}
                end
            end
            table.sort(_KY, function(_Lf, _Lg)
                if _Lf.e.r ~= _Lg.e.r then
                    return _Lf.e.r > _Lg.e.r
                end
                return (_Lf.e.nxt or math.huge) < (_Lg.e.nxt or math.huge)
            end)
            local _Lh = {}
            for _Li, _Lj in ipairs(_KY) do
                if _Li > _JX.Limit then
                    _Lh[#_Lh + 1] = ("... +%d jenis lain"):format(#_KY - _JX.Limit)
                    break
                end
                local _Lk = ("%s: %d siap | %d tumbuh"):format(_Lj.name, _Lj.e.r, _Lj.e.g)
                if _Lj.e.nxt then
                    _Lk = _Lk .. " (berikut " .. _KU(_Lj.e.nxt) .. ")"
                end
                _Lh[#_Lh + 1] = _Lk
            end
            if #_Lh == 0 then
                _Lh[1] = (_Lb ~= "") and "Tidak ada yang cocok" or "Tidak ada pohon"
            end
            return table.concat(_Lh, "\n"), _KZ, _La
        end
        local function _Ll(_Lm, _Ln, _Lo)
            if _JX[_Lo] == _Ln then
                return
            end
            _JX[_Lo] = _Ln
            if _Lm then
                pcall(function()
                    _Lm:SetDesc(_Ln)
                end)
            end
        end
        function _JX.run()
            if _JX.Busy then
                return
            end
            _JX.Busy = true
            local _Lp = _P.World
            local _Lq, _Lr, _Ls = _Ku()
            local _Lt, _Lu, _Lv, _Lw, _Lx = _KC()
            local _Ly, _Lz, _LA = "Data pohon belum ketemu", nil, nil
            if _Lx then
                _Ly, _Lz, _LA = _KW(_Lx)
            end
            local _LB = _Lq and select(1, _Kg(_Lq, _dM)) or "Data drop belum ketemu. Tekan 'Hubungkan ke game'"
            local _LC = "Data world belum ketemu. Tekan 'Hubungkan ke game'"
            if _Lt then
                local _LD
                if _JX.Layer == "Depan" then
                    _LD = _Lt
                elseif _JX.Layer == "Background" then
                    _LD = _Lu
                else
                    _LD = {}
                    for _LE, _LF in pairs(_Lt) do
                        _LD[_LE] = (_LD[_LE] or 0) + _LF
                    end
                    for _LG, _LH in pairs(_Lu) do
                        _LD[_LG] = (_LD[_LG] or 0) + _LH
                    end
                end
                _LC = select(1, _Kg(_LD, _Kc))
            end
            local _LI = _Lp and rawget(_Lp, "name")
            local _LJ = table.concat({
                "World: " .. ((type(_LI) == "string" and _LI ~= "") and _LI or "-") .. (_Lp and type(_Lp.w) == "number" and (" (" .. _Lp.w .. "x" .. _Lp.h .. ")") or ""),
                "Block depan: " .. (_Lv and _JY(_Lv) or "-") .. " | Background: " .. (_Lw and _JY(_Lw) or "-"),
                "Floating: " .. (_Lr and (_JY(_Lr) .. " item (" .. _Ls .. " tumpukan)") or "-"),
                "Pohon: " .. (_Lz and (_JY(_Lz) .. " siap panen | " .. _JY(_LA) .. " tumbuh") or "-"),
                "Scan terakhir: " .. os.date("%H:%M:%S"),
            }, "\n")
            _Ll(_S.ScanInfo, _LJ, "_info")
            _Ll(_S.ScanFloat, _LB, "_float")
            _Ll(_S.ScanBlocks, _LC, "_blocks")
            _Ll(_S.ScanTrees, _Ly, "_trees")
            _JX.Busy = false
        end
        task.spawn(function()
            local _LK = 0
            while _e() do
                if _JX.Auto and os.clock() - _LK >= _JX.Every then
                    _LK = os.clock()
                    pcall(_JX.run)
                end
                task.wait(0.5)
            end
        end)
    end)()
end
_bL.add("Growscan", _JX, {"Auto", "Layer"}) do
    (function()
        local _LL = _ER("Growscan", "scan-search", "fitur")
        _EI(function()
            _S.ScanInfo = _LL:Paragraph({Title = "Info World", Desc = "Tekan Scan sekarang"})
        end)
        local _LM = _EY(_LL, "Kontrol", true)
        local _LN = _EY(_LL, "Floating Items", true)
        local _LO = _EY(_LL, "World Blocks", false)
        local _LP = _EY(_LL, "Pohon (siap panen)", true)
        _EI(function()
            _LM:Toggle({
                Title = "Auto Scan",
                Desc = "Update otomatis tiap 2 detik",
                Value = _JX.Auto,
                Callback = function(_LQ)
                    _JX.Auto = _LQ
                    if _LQ then
                        task.spawn(_JX.run)
                    end
                end,
            })
        end)
        _EI(function()
            _LM:Button({
                Title = "Scan sekarang",
                Callback = function()
                    task.spawn(_JX.run)
                end,
            })
        end)
        _EI(function()
            _LM:Input({
                Title = "Cari item",
                Desc = "Saring nama item (kosongkan = semua)",
                Value = "",
                Placeholder = "contoh: seed",
                Callback = function(_LR)
                    _JX.Filter = tostring(_LR or ""):gsub("^%s+", ""):gsub("%s+$", "")
                    task.spawn(_JX.run)
                end,
            })
        end)
        _EI(function()
            _S.ScanFloat = _LN:Paragraph({Title = "Daftar", Desc = "-"})
        end)
        _EI(function()
            _LO:Dropdown({
                Title = "Layer",
                Values = {"Semua", "Depan", "Background"},
                Value = _JX.Layer,
                Callback = function(_LS)
                    _JX.Layer = _LS
                    task.spawn(_JX.run)
                end,
            })
        end)
        _EI(function()
            _S.ScanBlocks = _LO:Paragraph({Title = "Daftar", Desc = "-"})
        end)
        _EI(function()
            _S.ScanTrees = _LP:Paragraph({Title = "Daftar", Desc = "-"})
        end)
    end)()
end do
    (function()
        local function _LT()
            local _LU = _P.Gems
            local _LV = _LU and rawget(_LU, "addGems")
            if type(_LV) ~= "function" then
                return nil
            end
            for _LW, _LX in pairs(_gx(_LV)) do
                if type(_LX) == "number" then
                    return _LX
                end
            end
            return nil
        end
        _cy.gemsNow = _LT
        local function _LY(_LZ)
            local _Ma = tostring(math.floor(_LZ or 0))
            local _Mb = string.sub(_Ma, 1, 1) == "-"
            if _Mb then
                _Ma = string.sub(_Ma, 2)
            end
            local _Mc = _Ma:reverse():gsub("(%d%d%d)", "%1."):reverse()
            _Mc = _Mc:gsub("^%.", "")
            return (_Mb and "-" or "") .. _Mc
        end
        local function _Md(_Me)
            _Me = math.max(0, math.floor(_Me))
            return ("%dj %dm %dd"):format(_Me // 3600, _Me % 3600 // 60, _Me % 60)
        end
        local function _Mf()
            return {
                broken = _D.Broken,
                placed = _D.Placed,
                collected = _D.Collected,
                harvested = _M.Harvested,
                planted = _M.Planted,
            }
        end
        function _cy.reset()
            _cy.T0 = os.clock()
            _cy.Gems0 = _LT()
            _cy.Items = {}
            _cy.Base = _Mf()
        end
        _cy.Base = _Mf()
        function _cy.text()
            local _Mg = math.max((os.clock() - _cy.T0) / 3600, 1 / 3600)
            local _Mh, _Mi = _Mf(), _cy.Base
            local function _Mj(_Mk, _Ml)
                local _Mm = _Mh[_Ml] - (_Mi[_Ml] or 0)
                return ("%s: %s  (%s/jam)"):format(_Mk, _LY(_Mm), _LY(_Mm / _Mg))
            end
            local _Mn = _LT()
            if _Mn and not _cy.Gems0 then
                _cy.Gems0 = _Mn
            end
            local _Mo = "Gems: -"
            if _Mn and _cy.Gems0 then
                local _Mp = _Mn - _cy.Gems0
                _Mo = ("Gems: %s  (%s%s, %s/jam)"):format(_LY(_Mn), _Mp >= 0 and "+" or "", _LY(_Mp), _LY(_Mp / _Mg))
            end
            local _Mq = {}
            for _Mr, _Ms in pairs(_cy.Items) do
                _Mq[#_Mq + 1] = {id = _Mr, n = _Ms}
            end
            table.sort(_Mq, function(_Mt, _Mu)
                return _Mt.n > _Mu.n
            end)
            local _Mv = {}
            for _Mw = 1, math.min(5, #_Mq) do
                _Mv[_Mw] = _dM(_Mq[_Mw].id) .. " x" .. _LY(_Mq[_Mw].n)
            end
            return table.concat({
                "Lama sesi: " .. _Md(os.clock() - _cy.T0),
                _Mo,
                _Mj("Block pecah", "broken"),
                _Mj("Block di-place", "placed"),
                _Mj("Drop diambil", "collected"),
                _Mj("Panen", "harvested"),
                _Mj("Tanam", "planted"),
                "Item terbanyak: " .. ((#_Mv > 0) and table.concat(_Mv, ", ") or "-"),
            }, "\n")
        end
        task.spawn(function()
            local _Mx = os.clock()
            while _e() do
                local _My, _Mz = pcall(_cy.text)
                if _My and _S.StatsText and _Mz ~= _cy.Shown then
                    _cy.Shown = _Mz
                    pcall(function()
                        _S.StatsText:SetDesc(_Mz)
                    end)
                end
                if _cz.ReportMin > 0 and os.clock() - _Mx >= _cz.ReportMin * 60 then
                    _Mx = os.clock()
                    if _My then
                        _cz.send("report", "Laporan statistik\n```\n" .. _Mz .. "\n```")
                    end
                elseif _cz.ReportMin <= 0 then
                    _Mx = os.clock()
                end
                task.wait(1)
            end
        end)
    end)()
end do
    (function()
        local _MA = _ER("Statistik", "bar-chart-3", "fitur")
        _EI(function()
            _S.StatsText = _MA:Paragraph({Title = "Sesi ini", Desc = "-"})
        end)
        _EI(function()
            _MA:Button({
                Title = "Reset statistik",
                Desc = "Mulai hitung dari nol",
                Callback = function()
                    _cy.reset()
                    _bH("Statistik", "Direset", 2)
                end,
            })
        end)
        _EI(function()
            _MA:Button({
                Title = "Kirim ke Discord sekarang",
                Desc = "Perlu webhook di tab Discord",
                Callback = function()
                    local _MB, _MC = pcall(_cy.text)
                    if not (_cz.On and _cz.valid(_cz.Url)) then
                        _bH("Statistik", "Aktifkan webhook Discord dulu", 3)
                    elseif _MB then
                        _cz.send("report", "Laporan statistik\n```\n" .. _MC .. "\n```")
                        _bH("Statistik", "Masuk antrian kirim", 2)
                    end
                end,
            })
        end)
    end)()
end
local _MD = {
    TrashOn = false,
    TrashList = {},
    TrashAt = 150,
    Keep = 0,
    LockOn = false,
    Recycled = 0,
    Converted = 0,
    Status = "-",
} do
    (function()
        local _ME = {[242] = true, [1796] = true, [7188] = true}
        local _MF = {
            {from = 242, to = 1796, name = "Diamond Lock"},
            {from = 1796, to = 7188, name = "Blue Gem Lock"},
        }
        local function _MG(...)
            local _MH = _P.World
            local _MI = _MH and rawget(_MH, "call")
            if type(_MI) ~= "function" then
                return false
            end
            return pcall(_MI, ...)
        end
        local function _MJ(_MK)
            local _ML = _p[_MK]
            return _ML ~= nil and _ML.kind ~= "tool" and not _ME[_MK]
        end
        function _MD.recycle(_MM, _MN)
            if not _P.Inv or _MN <= 0 or not _MJ(_MM) then
                return false
            end
            _MN = math.min(_MN, _dP(_MM))
            if _MN <= 0 then
                return false
            end
            pcall(function()
                _P.Inv:remove(_MM, _MN)
            end)
            local _MO = _MG("Recycle", _MM, _MN)
            if _MO then
                _MD.Recycled += _MN
                _MD.Status = ("Recycle %s x%d"):format(_dM(_MM), _MN)
            end
            return _MO
        end
        local function _MP(_MQ)
            local _MR = _P.Inv
            if not _MR or _dP(_MQ.from) < 100 then
                return false
            end
            local _MS, _MT = pcall(function()
                return _MR:used()
            end)
            local _MU, _MV = pcall(function()
                return _MR.capacity
            end)
            if _dP(_MQ.to) + 1 > 200 then
                return false
            end
            if _dP(_MQ.to) == 0 and _dP(_MQ.from) ~= 100 and _MS and _MU and type(_MT) == "number" and type(_MV) == "number" and _MT >= _MV then
                return false
            end
            pcall(function()
                _MR:remove(_MQ.from, 100)
                _MR:add(_MQ.to, 1)
            end)
            local _MW = _MG("ConvertLock", _MQ.from, _MQ.to)
            if _MW then
                _MD.Converted += 1
                _MD.Status = "Convert ke " .. _MQ.name
            end
            return _MW
        end
        function _MD.tick()
            if _MD.TrashOn then
                for _MX, _MY in ipairs(_MD.TrashList) do
                    local _MZ = _dP(_MY)
                    if _MZ >= _MD.TrashAt and _MZ > _MD.Keep then
                        _MD.recycle(_MY, _MZ - _MD.Keep)
                        task.wait(0.5)
                    end
                end
            end
            if _MD.LockOn then
                for _Na, _Nb in ipairs(_MF) do
                    if _MP(_Nb) then
                        task.wait(0.5)
                    end
                end
            end
        end
        function _MD.labels()
            local _Nc, _Nd = {}, {}
            if _P.Inv then
                for _Ne, _Nf in ipairs(_P.Inv.slots) do
                    local _Ng = _Nf.id
                    if _Ng and not _Nd[_Ng] and (_Nf.n or 0) > 0 and _MJ(_Ng) then
                        _Nd[_Ng] = true
                        _Nc[#_Nc + 1] = {id = _Ng, label = ("%s [%d]"):format(_dM(_Ng), _Ng)}
                    end
                end
            end
            for _Nh, _Ni in ipairs(_MD.TrashList) do
                if not _Nd[_Ni] then
                    _Nd[_Ni] = true
                    _Nc[#_Nc + 1] = {id = _Ni, label = ("%s [%d]"):format(_dM(_Ni), _Ni)}
                end
            end
            table.sort(_Nc, function(_Nj, _Nk)
                return _Nj.id < _Nk.id
            end)
            local _Nl, _Nm = {}, {}
            for _Nn, _No in ipairs(_Nc) do
                _Nl[#_Nl + 1] = _No.label
                if table.find(_MD.TrashList, _No.id) then
                    _Nm[#_Nm + 1] = _No.label
                end
            end
            return _Nl, _Nm
        end
        task.spawn(function()
            while _e() do
                pcall(_MD.tick)
                if _S.BagStatus then
                    local _Np = (("Status: %s\nDi-recycle: %d item | Convert lock: %d kali\nItem dipi" .. "lih: %d")):format(_MD.Status, _MD.Recycled, _MD.Converted, #_MD.TrashList)
                    if _Np ~= _MD.Shown then
                        _MD.Shown = _Np
                        pcall(function()
                            _S.BagStatus:SetDesc(_Np)
                        end)
                    end
                end
                task.wait(3)
            end
        end)
    end)()
end
_bL.add("Tas", _MD, {"TrashOn", "TrashList", "TrashAt", "Keep", "LockOn"}) do
    (function()
        local _Nq = _ER("Tas", "backpack", "fitur")
        _EI(function()
            _S.BagStatus = _Nq:Paragraph({Title = "Status", Desc = "-"})
        end)
        local _Nr = _EY(_Nq, "Auto Recycle (buang item)", true)
        local _Ns = _EY(_Nq, "Auto Convert Lock", false)
        _EI(function()
            _Nr:Toggle({
                Title = "Auto Recycle",
                Desc = "Item yang dipilih di-recycle otomatis",
                Value = _MD.TrashOn,
                Callback = function(_Nt)
                    _MD.TrashOn = _Nt
                end,
            })
        end)
        _EI(function()
            local _Nu, _Nv = _MD.labels()
            _S.TrashDropdown = _Nr:Dropdown({
                Title = "Item yang di-recycle",
                Desc = "Bisa pilih banyak. Tool & lock tidak ditampilkan",
                Values = (#_Nu > 0) and _Nu or {"(inventori belum terbaca)"},
                Value = _Nv,
                Multi = true,
                AllowNone = true,
                Callback = function(_Nw)
                    local _Nx = {}
                    for _Ny, _Nz in ipairs(type(_Nw) == "table" and _Nw or {_Nw}) do
                        local _NA = tonumber(string.match(tostring(_Nz), "%[(%d+)%]$"))
                        if _NA then
                            _Nx[#_Nx + 1] = _NA
                        end
                    end
                    _MD.TrashList = _Nx
                end,
            })
        end)
        local _NB = nil
        _S.TrashRefresh = function(_NC)
            local _ND, _NE = _MD.labels()
            local _NF = table.concat(_ND, "|")
            if not _NC and _NF == _NB then
                return
            end
            _NB = _NF
            if not _S.TrashDropdown then
                return
            end
            pcall(function()
                _S.TrashDropdown:Refresh((#_ND > 0) and _ND or {"(inventori kosong)"})
            end)
            if #_NE > 0 then
                pcall(function()
                    _S.TrashDropdown:Select(_NE)
                end)
            end
        end
        _Ff(_Nr, {
            Title = "Recycle kalau jumlah >=",
            Desc = "200 = hanya saat penuh 1 slot",
            Min = 1,
            Max = 200,
            Step = 1,
            Default = _MD.TrashAt,
            Callback = function(_NG)
                _MD.TrashAt = math.floor(_NG)
            end,
        })
        _Ff(_Nr, {
            Title = "Sisakan",
            Desc = "Jumlah yang tidak ikut di-recycle",
            Min = 0,
            Max = 199,
            Step = 1,
            Default = _MD.Keep,
            Callback = function(_NH)
                _MD.Keep = math.floor(_NH)
            end,
        })
        _EI(function()
            _Nr:Button({
                Title = "Refresh daftar item",
                Callback = function()
                    _S.TrashRefresh(true)
                end,
            })
        end)
        _EI(function()
            _Ns:Toggle({
                Title = "Auto Convert Lock",
                Desc = "100 WL -> 1 DL, 100 DL -> 1 BGL (sama seperti game)",
                Value = _MD.LockOn,
                Callback = function(_NI)
                    _MD.LockOn = _NI
                end,
            })
        end)
    end)()
end do
    (function()
        local _NJ, _NK = pcall(require, _m:FindFirstChild("Splice"))
        function _H.result(_NL, _NM)
            if not (_NJ and type(_NK) == "table" and type(_NK.result) == "function") then
                return nil
            end
            if not (_NL and _NM) then
                return nil
            end
            local _NN, _NO = pcall(_NK.result, _NL, _NM)
            return _NN and _NO or nil
        end
        local function _NP()
            if _S.SpliceToggle then
                pcall(function()
                    _S.SpliceToggle:Set(_H.Running)
                end)
            end
        end
        function _H.stop(_NQ)
            _H.Running = false
            if _H.Roaming then
                _kj.stopSpliceRoam()
            end
            _H.Status = _NQ or "Dihentikan"
            _NP()
            if _NQ then
                _bH("Auto Splice", _NQ, 4)
            end
        end
        local function _NR(_NS, _NT)
            local _NU, _NV = _P.Trees, _P.World
            local _NW = _NU and _NV and _NU[_NT * _NV.w + _NS]
            return type(_NW) == "table" and _NW.s == true
        end
        local function _NX(_NY, _NZ)
            local _Oa = _P.World
            local _Ob = _Oa and rawget(_Oa, "spliceSeed")
            if type(_Ob) ~= "function" then
                return false, "fungsi splice game tidak ketemu"
            end
            local _Oc, _Od = pcall(_Ob, _NY, _NZ, _H.B)
            if _Oc and _Od and _p[_Od] then
                pcall(function()
                    _P.Inv:remove(_H.B, 1)
                end)
                if _P.SetTile then
                    pcall(_P.SetTile, "fg", _NY, _NZ, _Od, true)
                end
                _H.Made += 1
                _H.Status = ("Splice jadi %s (%d,%d)"):format(_dM(_Od), _NY, _NZ)
                return true
            end
            return false, "ditolak server"
        end
        local function _Oe(_Of)
            while _H.Running and _e() and _H.RunId == _Of do
                local _Og, _Oh = _fe()
                if not _Og then
                    _H.stop("Karakter tidak ditemukan (keluar world?)")
                    return
                end
                local _Oi, _Oj = _H.A, _H.B
                local _Ok = false
                local _Ol = os.clock()
                for _Om, _On in ipairs(_fq()) do
                    if not _H.Running then
                        break
                    end
                    local _Oo, _Op = _Og + _On.dx, _Oh + _On.dy
                    local _Oq = _Oo .. "," .. _Op
                    if not (_H.Fail[_Oq] and _H.Fail[_Oq] > _Ol) then
                        local _Or = _eR("fg", _Oo, _Op)
                        if _Or == 0 and _dP(_Oi) > 0 and _dP(_Oj) > 0 and _kj.plantSpotOk(_Oo, _Op, _Oi) then
                            _fx("fg", _Oo, _Op, _Oi)
                            pcall(function()
                                _P.Inv:remove(_Oi, 1)
                            end)
                            _H.Planted += 1
                            _H.Status = ("Tanam %s (%d,%d)"):format(_dM(_Oi), _Oo, _Op)
                            _Ok = true
                            task.wait(_H.Ms / 1000)
                            _Or = _eR("fg", _Oo, _Op)
                        end
                        if _Or == _Oi and _dP(_Oj) > 0 and not _NR(_Oo, _Op) then
                            local _Os, _Ot = _NX(_Oo, _Op)
                            if not _Os then
                                _H.Fail[_Oq] = os.clock() + 30
                                _H.Status = ("Gagal splice (%d,%d): %s"):format(_Oo, _Op, _Ot)
                            end
                            _Ok = true
                            task.wait(_H.Ms / 1000)
                        end
                    end
                end
                if not _Ok then
                    if _dP(_Oi) <= 0 or _dP(_Oj) <= 0 then
                        _H.stop("Seed habis")
                        return
                    end
                    _H.Status = "Menunggu tile Grid kosong (panen dulu pohonnya)"
                    task.wait(1)
                end
            end
        end
        function _H.start()
            if _H.Running then
                return
            end
            local _Ou
            if not _P.World then
                _Ou = "Data world belum ketemu. Tekan 'Hubungkan ke game'"
            elseif not (_H.A and _H.B) then
                _Ou = "Pilih Seed A dan Seed B dulu"
            elseif _H.A == _H.B then
                _Ou = "Seed A dan Seed B harus beda"
            elseif not _H.result(_H.A, _H.B) then
                _Ou = "Kombinasi ini tidak bisa di-splice"
            elseif not _H.Roam and next(_D.Offsets) == nil then
                _Ou = ("Pilih tile dulu di Grid Tile (tab Farm), atau nyalakan Keliling " .. "world")
            elseif _D.Running or _F.Running or _M.Running then
                _Ou = "Hentikan Auto Farm / Clear / Farmer dulu"
            end
            if _Ou then
                _bH("Auto Splice", _Ou, 4)
                _NP()
                return
            end
            table.clear(_H.Fail)
            _H.Running = true
            _H.RunId = (_H.RunId or 0) + 1
            _NP()
            if _H.Roam then
                local _Ov = _kj.startSpliceRoam()
                if _Ov then
                    _H.stop(_Ov)
                end
            else
                task.spawn(_Oe, _H.RunId)
            end
        end
        function _H.resultText()
            if not (_H.A and _H.B) then
                return "Pilih Seed A dan Seed B"
            end
            local _Ow = _H.result(_H.A, _H.B)
            if not _Ow then
                return "Hasil: tidak bisa di-splice"
            end
            return "Hasil: " .. _dM(_Ow)
        end
        task.spawn(function()
            while _e() do
                if _S.SpliceStatus then
                    local _Ox = (("Status: %s\n%s\nSeed A: %s (x%d) | Seed B: %s (x%d)\nDitanam: %d | " .. "Splice jadi: %d")):format(_H.Running and _H.Status or ("BERHENTI - " .. _H.Status), _H.resultText(), _H.A and _dM(_H.A) or "-", _H.A and _dP(_H.A) or 0, _H.B and _dM(_H.B) or "-", _H.B and _dP(_H.B) or 0, _H.Planted, _H.Made)
                    if _Ox ~= _H.Shown then
                        _H.Shown = _Ox
                        pcall(function()
                            _S.SpliceStatus:SetDesc(_Ox)
                        end)
                    end
                end
                task.wait(1)
            end
        end)
    end)()
end
_bL.add("Splice", _H, {"A", "B", "Ms", "Roam"})
_H.Ms = math.max(_H.Ms, 140) do
    (function()
        local _Oy = _ER("Splice", "git-merge", "farm")
        _EI(function()
            _S.SpliceStatus = _Oy:Paragraph({Title = "Status Splice", Desc = "-"})
        end)
        local _Oz = _EY(_Oy, "Kontrol", true)
        local _OA = _EY(_Oy, "Seed", true)
        local _OB = _EY(_Oy, "Kecepatan", false)
        _EI(function()
            _S.SpliceToggle = _Oz:Toggle({
                Title = "Auto Splice",
                Desc = "Tanam Seed A lalu splice Seed B",
                Value = false,
                Callback = function(_OC)
                    if _OC then
                        _H.start()
                    elseif _H.Running then
                        _H.stop()
                    end
                end,
            })
        end)
        local function _OD()
            local _OE = {}
            for _OF, _OG in ipairs(_ej()) do
                _OE[#_OE + 1] = ("%s [%d]"):format(_dM(_OG), _OG)
            end
            if #_OE == 0 then
                _OE = {"(tidak ada seed di inventori)"}
            end
            return _OE
        end
        local function _OH(_OI)
            return tonumber(string.match(tostring(_OI or ""), "%[(%d+)%]$"))
        end
        _EI(function()
            _S.SpliceA = _OA:Dropdown({
                Title = "Seed A (ditanam)",
                Values = {"(memuat...)"},
                Callback = function(_OJ)
                    local _OK = _OH(_OJ)
                    if _OK then
                        _H.A = _OK
                    end
                end,
            })
        end)
        _EI(function()
            _S.SpliceB = _OA:Dropdown({
                Title = "Seed B (di-splice)",
                Values = {"(memuat...)"},
                Callback = function(_OL)
                    local _OM = _OH(_OL)
                    if _OM then
                        _H.B = _OM
                    end
                end,
            })
        end)
        local _ON = nil
        _S.SpliceRefresh = function(_OO)
            local _OP = _OD()
            local _OQ = table.concat(_OP, "|")
            if not _OO and _OQ == _ON then
                return
            end
            _ON = _OQ
            for _OR, _OS in ipairs({{_S.SpliceA, _H.A}, {_S.SpliceB, _H.B}}) do
                local _OT, _OU = _OS[1], _OS[2]
                if _OT then
                    pcall(function()
                        _OT:Refresh(_OP)
                    end)
                    if _OU then
                        local _OV = "[" .. _OU .. "]"
                        for _OW, _OX in ipairs(_OP) do
                            if string.sub(_OX, -#_OV) == _OV then
                                pcall(function()
                                    _OT:Select(_OX)
                                end)
                                break
                            end
                        end
                    end
                end
            end
        end
        _EI(function()
            _OA:Button({
                Title = "Refresh daftar seed",
                Callback = function()
                    _S.SpliceRefresh(true)
                end,
            })
        end)
        _EI(function()
            _Oz:Toggle({
                Title = "Keliling world (A*)",
                Desc = "Nyala: jalan ke seluruh world. Mati: hanya tile Grid 5x5",
                Value = _H.Roam,
                Callback = function(_OY)
                    if _H.Running then
                        _H.stop("Mode diganti, nyalakan lagi")
                    end
                    _H.Roam = _OY
                end,
            })
        end)
        _Ff(_OB, {
            Title = "Jeda tanam / splice (ms)",
            Min = 140,
            Max = 2000,
            Step = 10,
            Default = _H.Ms,
            Callback = function(_OZ)
                _H.Ms = math.floor(_OZ)
            end,
        })
    end)()
end do
    (function()
        local _Pa = _ER("Lahan", "layout-grid", "farm")
        _EI(function()
            _S.LahanStatus = _Pa:Paragraph({Title = "Status Lahan", Desc = "-"})
        end)
        local _Pb = _EY(_Pa, "Bangun Lahan", true)
        local _Pc = _EY(_Pa, "Bentuk lahan", true)
        local _Pd = _EY(_Pa, "Pilihan", false)
        _EI(function()
            _S.BuildToggle = _Pb:Toggle({
                Title = "Bangun Lahan",
                Desc = ("Hitung block, produksi kalau kurang, lalu pasang dari baris bawa" .. "h"),
                Value = false,
                Callback = function(_Pe)
                    if _Pe then
                        _J.start()
                    elseif _J.Running then
                        _J.stop()
                    end
                end,
            })
        end)
        _EI(function()
            _S.BuildBlockDropdown = _Pb:Dropdown({
                Title = "Block lahan",
                Desc = "Block padat dari inventori",
                Values = {"(memuat...)"},
                Callback = function(_Pf)
                    local _Pg = tonumber(string.match(_Pf or "", "%[(%d+)%]$"))
                    if _Pg then
                        _J.BlockId = _Pg
                    end
                end,
            })
        end)
        local function _Ph(_Pi, _Pj)
            local _Pk = tonumber(tostring(_Pi or ""):match("%-?%d+"))
            return _Pk or _Pj
        end
        _EI(function()
            _Pc:Input({
                Title = "X awal",
                Desc = "Kolom paling kiri",
                Value = tostring(_I.X0),
                Placeholder = "0",
                Callback = function(_Pl)
                    _I.X0 = math.max(0, _Ph(_Pl, _I.X0))
                end,
            })
        end)
        _EI(function()
            _Pc:Input({
                Title = "X akhir",
                Desc = "Kolom paling kanan (lebih dari lebar world = sampai ujung)",
                Value = tostring(_I.X1),
                Placeholder = "99",
                Callback = function(_Pm)
                    _I.X1 = math.max(0, _Ph(_Pm, _I.X1))
                end,
            })
        end)
        _EI(function()
            _Pc:Input({
                Title = "Y baris atas",
                Desc = "Baris block paling atas (minimal 1)",
                Value = tostring(_I.Y0),
                Placeholder = "2",
                Callback = function(_Pn)
                    _I.Y0 = math.max(1, _Ph(_Pn, _I.Y0))
                end,
            })
        end)
        _Ff(_Pc, {
            Title = "Jarak antar baris",
            Desc = ("2 = y1, y3, y5.. | 3 = y1, y4, y7.. (maks 3 supaya bisa lompat n" .. "aik)"),
            Min = 2,
            Max = 3,
            Step = 1,
            Default = _I.Gap,
            Callback = function(_Po)
                _I.Gap = math.floor(_Po)
            end,
        })
        _Ff(_Pc, {
            Title = "Jumlah baris",
            Min = 1,
            Max = 60,
            Step = 1,
            Default = _I.Rows,
            Callback = function(_Pp)
                _I.Rows = math.floor(_Pp)
            end,
        })
        _EI(function()
            _Pc:Toggle({
                Title = "Tangga di pojok kiri-kanan",
                Desc = "Ujung baris dibuka bergantian, jadi bisa turun-naik zig-zag",
                Value = _I.Stairs,
                Callback = function(_Pq)
                    _I.Stairs = _Pq
                end,
            })
        end)
        _EI(function()
            _Pc:Button({
                Title = "Pakai posisi karakter sebagai pojok kiri-atas",
                Desc = "X awal = kolom karakter, Y baris atas = tile di bawah kaki",
                Callback = function()
                    local _Pr, _Ps = _kj.here()
                    if not _Pr then
                        _bH("Lahan", "Kamu belum masuk world", 3)
                        return
                    end
                    _I.X0, _I.Y0 = _Pr, _Ps + 1
                    _bH("Lahan", ("X awal %d, Y baris atas %d"):format(_I.X0, _I.Y0), 4)
                end,
            })
        end)
        _EI(function()
            _Pd:Toggle({
                Title = "Produksi block kalau kurang",
                Desc = "Tanam & panen seed block itu dulu sampai cukup",
                Value = _J.Produce,
                Callback = function(_Pt)
                    _J.Produce = _Pt
                end,
            })
        end)
        _EI(function()
            _Pd:Toggle({
                Title = "Boleh taruh block pijakan",
                Desc = "Kalau baris paling bawah tidak terjangkau dari tanah",
                Value = _J.UseBlock,
                Callback = function(_Pu)
                    _J.UseBlock = _Pu
                    _kj.resetReach()
                end,
            })
        end)
        _EI(function()
            _Pd:Toggle({
                Title = "Lanjut Auto Rotasi setelah selesai",
                Value = _J.ThenPabrik,
                Callback = function(_Pv)
                    _J.ThenPabrik = _Pv
                end,
            })
        end)
        task.spawn(function()
            while _e() do
                local _Pw
                if _P.World then
                    local _Px = _kj.landInfo(_J.BlockId)
                    local _Py = _kj.landRows()
                    local _Pz = _J.BlockId and _dP(_J.BlockId) or 0
                    local _PA = _kj.seedOfBlock(_J.BlockId)
                    _Pw = table.concat({
                        "Status   : " .. (_J.Running and "JALAN" or "BERHENTI") .. " - " .. _J.Phase,
                        ("Bentuk   : %d baris (y %s), x %d-%d, jarak %d%s"):format(#_Py, (#_Py > 0) and (_Py[1] .. "-" .. _Py[#_Py]) or "-", math.min(_I.X0, _I.X1), math.max(_I.X0, _I.X1), _I.Gap, _I.Stairs and ", tangga" or ""),
                        ("Block    : %s | punya %d | butuh %d%s"):format(_J.BlockId and _dM(_J.BlockId) or "-", _Pz, _Px.need, (_Px.need > _Pz) and (" (kurang " .. (_Px.need - _Pz) .. ")") or " (cukup)"),
                        ("Terpasang: %d / %d%s"):format(_Px.done, _Px.total, _Px.blocked > 0 and (" | terhalang block lain: " .. _Px.blocked) or ""),
                        (_Px.gap > 0) and ("Celah tanam terisi block: " .. _Px.gap .. " (bersihkan dulu)") or "Celah tanam: bersih",
                        "Seed block: " .. (_PA and (_dM(_PA) .. " x" .. _dP(_PA)) or "-"),
                        "Aksi     : " .. _J.Status,
                    }, "\n")
                else
                    _Pw = "Data world belum ketemu"
                end
                if _S.LahanStatus and _Pw ~= _J.Shown then
                    _J.Shown = _Pw
                    pcall(function()
                        _S.LahanStatus:SetDesc(_Pw)
                    end)
                end
                task.wait(1)
            end
        end)
    end)()
end do
    (function()
        local _PB = _ER("Auto Rotasi", "factory", "farm")
        _EI(function()
            _S.PabrikStatus = _PB:Paragraph({Title = "Status Auto Rotasi", Desc = "-"})
        end)
        local _PC = _EY(_PB, "Kontrol Rotasi", true)
        local _PD = _EY(_PB, "World & Tile", true)
        local _PE = _EY(_PB, "Drop seed", false)
        _EI(function()
            _S.PabrikToggle = _PC:Toggle({
                Title = "Jalankan Auto Rotasi",
                Desc = "Rotasi inventory: break saat block cukup, tanam saat seed cukup, lalu harvest kembali",
                Value = false,
                Callback = function(_PF)
                    if _PF then
                        _K.start()
                    elseif _K.Running then
                        _K.stop()
                    end
                end,
            })
        end)
        _EI(function()
            _S.PabrikSeedDropdown = _PC:Dropdown({
                Title = "Seed rotasi",
                Desc = "Block pasangan seed akan dikenali otomatis (contoh: Dirt Seed -> Dirt)",
                Values = {"(memuat...)"},
                Callback = function(_PG)
                    local _PH = tonumber(string.match(_PG or "", "%[(%d+)%]$"))
                    if _PH then
                        _K.SeedId = _PH
                    end
                end,
            })
        end)
        _EI(function()
            _PC:Toggle({
                Title = "Tanam di seluruh world",
                Desc = "Mati = hanya di tile farming atau lahan yang dipilih",
                Value = _K.WholeWorld,
                Callback = function(_PI)
                    _K.WholeWorld = _PI
                end,
            })
        end)
        _EI(function()
            _PC:Dropdown({
                Title = "Mode world",
                Desc = "Same World = farming dan break di world yang sama; Separate World = break di world lain lalu kembali farming",
                Values = {"Same World", "Separate World"},
                Value = _K.WorldMode == "separate" and "Separate World" or "Same World",
                Callback = function(_mode)
                    _K.WorldMode = (_mode == "Separate World") and "separate" or "same"
                end,
            })
        end)
        _EI(function()
            _PD:Input({
                Title = "World farming",
                Desc = "Kosongkan untuk memakai world tempat kamu sedang berada saat Start.",
                Value = _K.FarmWorld,
                Placeholder = "WORLD_FARM",
                Callback = function(_world)
                    _K.FarmWorld = tostring(_world or ""):upper():gsub("%s", "")
                end,
            })
        end)
        _EI(function()
            _PD:Button({
                Title = "Gunakan world sekarang sebagai farming",
                Desc = "Menyimpan nama world tempat karakter berada saat ini.",
                Callback = function()
                    local _world = _L.worldName()
                    if _world and _world ~= "" then
                        _K.FarmWorld = _world
                        _bH("Noxablox", "Farming world: " .. _world, 3)
                    else
                        _bH("Noxablox", "Kamu belum masuk world", 3)
                    end
                end,
            })
        end)
        _EI(function()
            _PD:Input({
                Title = "World break",
                Desc = "Dipakai saat mode Separate World. Isi nama world saja.",
                Value = _K.BreakWorld,
                Placeholder = "WORLD_BREAK",
                Callback = function(_world)
                    _K.BreakWorld = tostring(_world or ""):upper():gsub("%s", "")
                end,
            })
        end)
        _EI(function()
            _PD:Button({
                Title = "Gunakan world sekarang sebagai break",
                Desc = "Berguna untuk mode Separate World. Pastikan kamu sedang di world break.",
                Callback = function()
                    local _world = _L.worldName()
                    if _world and _world ~= "" then
                        _K.BreakWorld = _world
                        _bH("Noxablox", "Break world: " .. _world, 3)
                    else
                        _bH("Noxablox", "Kamu belum masuk world", 3)
                    end
                end,
            })
        end)
        _EI(function()
            _PC:Input({
                Title = "Batas block untuk rotasi",
                Desc = "Jumlah block di inventory sebagai batas pemicu rotasi (default 200).",
                Value = tostring(_K.BlockThreshold),
                Placeholder = "200",
                Callback = function(_value)
                    local _number = tonumber(_value)
                    if _number then _K.BlockThreshold = math.clamp(math.floor(_number), 1, 99999) end
                end,
            })
        end)
        _EI(function()
            _PC:Input({
                Title = "Batas seed",
                Desc = "Batas seed inventory sebelum fase tanam/rotasi (default 190).",
                Value = tostring(_K.SeedThreshold),
                Placeholder = "190",
                Callback = function(_value)
                    local _number = tonumber(_value)
                    if _number then _K.SeedThreshold = math.clamp(math.floor(_number), 1, 99999) end
                end,
            })
        end)
        _EI(function()
            _PD:Button({
                Title = "Pilih tile farming (Grid)",
                Desc = "Pilih area pohon untuk harvest dan planting. Anchor mengikuti posisi karakter saat grid dibuka.",
                Callback = function()
                    local _current = _L.worldName()
                    local _farmTarget = tostring(_K.FarmWorld or ""):upper():gsub("%s", "")
                    if _farmTarget ~= "" and _current ~= _farmTarget then
                        _bH("Noxablox", "Masuk ke farming world yang diatur sebelum memilih tile farming", 5)
                        return
                    end
                    if _S.setGridMode then
                        _S.setGridMode("rotasi_farm")
                    end
                    if _S.GridGui then
                        _S.GridGui.Enabled = true
                    end
                end,
            })
        end)
        _EI(function()
            _PD:Button({
                Title = "Pakai posisi sekarang untuk break",
                Desc = "Berdiri di tempat break, lalu tekan",
                Callback = function()
                    local _PJ, _PK = _kj.here()
                    if not _PJ then
                        _bH("Auto Rotasi", "Kamu belum masuk world", 3)
                        return
                    end
                    local _current = _L.worldName()
                    if _K.WorldMode == "separate" then
                        local _target = tostring(_K.BreakWorld or ""):upper():gsub("%s", "")
                        if _target == "" or _current ~= _target then
                            _bH("Noxablox", "Masuk ke world break yang diatur dulu, lalu simpan posisi break", 5)
                            return
                        end
                    elseif tostring(_K.FarmWorld or "") ~= "" and _current ~= tostring(_K.FarmWorld):upper():gsub("%s", "") then
                        _bH("Noxablox", "Masuk ke farming world sebelum menyimpan posisi break", 5)
                        return
                    end
                    _K.BreakX, _K.BreakY = _PJ, _PK
                    _bH("Noxablox", ("Posisi break (%d,%d) di %s"):format(_PJ, _PK, _L.worldName()), 3)
                end,
            })
        end)
        _EI(function()
            _PD:Button({
                Title = "Pilih tile break (Grid)",
                Desc = "Pilih tile yang akan dipukul di world break; terpisah dari tile farming",
                Callback = function()
                    local _current = _L.worldName()
                    if _K.WorldMode == "separate" then
                        local _target = tostring(_K.BreakWorld or ""):upper():gsub("%s", "")
                        if _target == "" or _current ~= _target then
                            _bH("Noxablox", "Masuk ke world break yang diatur sebelum memilih tile break", 5)
                            return
                        end
                    elseif tostring(_K.FarmWorld or "") ~= "" and _current ~= tostring(_K.FarmWorld):upper():gsub("%s", "") then
                        _bH("Noxablox", "Masuk ke farming world sebelum memilih tile break", 5)
                        return
                    end
                    local _baseX, _baseY = _kj.here()
                    if not _baseX then
                        _bH("Noxablox", "Kamu belum masuk world", 3)
                        return
                    end
                    _K.BreakX, _K.BreakY = _baseX, _baseY
                    if _S.setGridMode then
                        _S.setGridMode("pabrik")
                    end
                    if _S.GridGui then
                        _S.GridGui.Enabled = true
                    end
                end,
            })
        end)
        _Ff(_PD, {
            Title = "Lama 1 sesi break (detik)",
            Desc = "Setelah ini cek pohon siap dulu",
            Min = 15,
            Max = 300,
            Step = 5,
            Default = _K.BreakSec,
            Callback = function(_PL)
                _K.BreakSec = math.floor(_PL)
            end,
        })
        _EI(function()
            _PE:Toggle({
                Title = "Auto drop seed",
                Value = _K.Drop,
                Callback = function(_PM)
                    _K.Drop = _PM
                end,
            })
        end)
        _Ff(_PE, {
            Title = "Sisakan seed",
            Desc = "Untuk ditanam lagi",
            Min = 0,
            Max = 199,
            Step = 1,
            Default = _K.Keep,
            Callback = function(_PN)
                _K.Keep = math.floor(_PN)
            end,
        })
        _Ff(_PE, {
            Title = "Drop kalau seed sudah",
            Desc = "Contoh 200 & sisakan 50 = drop 150",
            Min = 2,
            Max = 200,
            Step = 1,
            Default = _K.DropAt,
            Callback = function(_PO)
                _K.DropAt = math.floor(_PO)
            end,
        })
        _EI(function()
            _S.DropWorldInput = _PE:Input({
                Title = "World drop",
                Desc = "Kosong = world ini | WORLD | WORLD:ID (masuk lewat pintu ID)",
                Value = _K.DropWorld,
                Placeholder = "STORAGE:1",
                Callback = function(_PP)
                    _K.DropWorld = tostring(_PP or "")
                end,
            })
        end)
        _EI(function()
            _PE:Button({
                Title = "Pakai posisi sekarang untuk drop",
                Desc = "Berdiri di tempat drop (boleh di world lain), lalu tekan",
                Callback = function()
                    local _PQ, _PR = _kj.here()
                    if not _PQ then
                        _bH("Auto Rotasi", "Kamu belum masuk world", 3)
                        return
                    end
                    _K.DropX, _K.DropY = _PQ, _PR
                    if not string.find(_K.DropWorld or "", ":", 1, true) then
                        _K.DropWorld = _L.worldName()
                        if _S.DropWorldInput then
                            pcall(function()
                                _S.DropWorldInput:Set(_K.DropWorld)
                            end)
                        end
                    end
                    _bH("Auto Rotasi", ("Posisi drop (%d,%d) di %s"):format(_PQ, _PR, _K.DropWorld), 4)
                end,
            })
        end)
        _EI(function()
            _PE:Button({
                Title = "Hapus posisi drop",
                Desc = "Drop di titik kedatangan (pintu) saja",
                Callback = function()
                    _K.DropX, _K.DropY = -1, -1
                    _bH("Auto Rotasi", "Posisi drop dihapus", 3)
                end,
            })
        end)
        local function _PS(_PT)
            local _PU = 0
            for _PV in pairs(_PT) do
                _PU += 1
            end
            return _PU
        end
        task.spawn(function()
            while _e() do
                local _PW, _PX = _K.SeedId, _kj.blockOfSeed(_K.SeedId)
                local _PY, _PZ = _kj.parseDropTarget()
                local _Qa = (_PY ~= "" and _PY or "world ini") .. (_PZ and (" pintu " .. _PZ) or "") .. (_K.DropX >= 0 and (" (" .. _K.DropX .. "," .. _K.DropY .. ")") or "")
                local _Qb = table.concat({
                    "Status : " .. (_K.Running and ("JALAN - fase " .. tostring(_K.Phase or "-")) or "BERHENTI"),
                    ("Seed   : %s x%d | block %s x%d"):format(_PW and _dM(_PW) or "-", _PW and _dP(_PW) or 0, _PX and _dM(_PX) or "-", _PX and _dP(_PX) or 0),
                    ("World  : %s | farm %s | break %s"):format(_K.WorldMode == "separate" and "Separate" or "Same", _K.Home ~= "" and _K.Home or (_K.FarmWorld ~= "" and _K.FarmWorld or "current"), _K.WorldMode == "separate" and (_K.BreakWorld ~= "" and _K.BreakWorld or "belum diatur") or "same world"),
                    ("Batas  : block %d | seed %d"):format(_K.BlockThreshold or 200, _K.SeedThreshold or 190),
                    ("Farm   : %d tile | Break: %s | %d tile"):format(_PS(_K.FarmTiles), _K.BreakX >= 0 and ("(" .. _K.BreakX .. "," .. _K.BreakY .. ")") or "belum diatur", _PS(_K.Tiles)),
                    ("Drop   : %s | sisakan %d, drop saat >= %d"):format(_K.Drop and _Qa or "mati", _K.Keep, _K.DropAt),
                    ("Hasil  : panen %d | tanam %d | di-drop %d"):format(_K.Harvested, _K.Planted, _K.Dropped),
                    "Aksi   : " .. _K.Status,
                }, "\n")
                if _S.PabrikStatus and _Qb ~= _K.Shown then
                    _K.Shown = _Qb
                    pcall(function()
                        _S.PabrikStatus:SetDesc(_Qb)
                    end)
                end
                if _S.GridMode == "pabrik" and _S.GridStart then
                    _S.GridStart.Text = _W.T(_K.Running and "STOP ROTASI" or "START ROTASI")
                    _S.GridStart.BackgroundColor3 = _K.Running and Color3.fromRGB(200, 60, 60) or Color3.fromRGB(46, 160, 90)
                end
                task.wait(1)
            end
        end)
    end)()
end
local _Qc = {
    On = false,
    World = true,
    Server = true,
    DelaySec = 5,
    ScriptUrl = "",
    Keep = false,
    Target = "",
    LastWorld = "",
    Last = nil,
    LastAt = 0,
    Busy = false,
    Count = 0,
    Status = "-",
} do
    (function()
        local _Qd = game:GetService("HttpService")
        local _Qe = game:GetService("TeleportService")
        local _Qf = game:GetService("GuiService")
        local _Qg = type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"
        local _Qh = "Fian/rejoin_" .. tostring(_k.UserId) .. ".json"
        task.spawn(function()
            while _e() do
                local _Qi = os.clock()
                local _Qj = _L.worldName and _L.worldName() or ""
                if _Qj ~= "" and not _K.Traveling then
                    _Qc.LastWorld = _Qj
                end
                if _L.anyRunning and _L.anyRunning() and _L.Mode == "idle" then
                    _Qc.Last = _L.snapshot()
                    _Qc.LastAt = _Qi
                elseif _Qi - _Qc.LastAt > 3 and _L.Mode == "idle" and _Qj ~= "" then
                    _Qc.Last = nil
                end
                task.wait(1)
            end
        end)
        local function _Qk(_Ql, _Qm)
            _L.afterEnter()
            _Qc.Count += 1
            _Qc.Status = "Masuk lagi berhasil, lanjut aktivitas"
            _bH("Auto Reconnect", _Qm .. ": lanjut aktivitas", 4)
            _cz.send("rejoin", _Qm .. " ke " .. tostring(_Ql.world) .. ", aktivitas dilanjutkan")
            _L.resumeSaved(_Ql)
        end
        local function _Qn(_Qo)
            if not (_Qc.On and _Qc.World) or _Qc.Busy or _K.Traveling then
                return
            end
            if _L.Mode == "away" or _L.Mode == "out" then
                return
            end
            local _Qp = _Qc.Last
            if not _Qp or _Qp.world == "" or os.clock() - _Qc.LastAt > 10 then
                return
            end
            _Qc.Busy = true
            task.spawn(function()
                _L.stopAll()
                local _Qq = tostring(_Qo or ""):gsub("`.", "")
                _Qc.Status = "Terlempar dari " .. _Qp.world .. ". Masuk lagi..."
                _cz.send("rejoin", "Terlempar dari world " .. _Qp.world .. (_Qq ~= "" and (" (" .. _Qq .. ")") or ""))
                task.wait(_Qc.DelaySec + 1.5)
                for _Qr = 1, 3 do
                    if not (_e() and _Qc.On) then
                        break
                    end
                    local _Qs, _Qt = _L.enterWorld(_Qp.world)
                    if _Qs then
                        task.wait(1.5)
                        _Qk(_Qp, "Masuk lagi")
                        _Qc.Busy = false
                        return
                    end
                    _Qc.Status = ("Gagal masuk (%d/3): %s"):format(_Qr, tostring(_Qt))
                    task.wait(10)
                end
                _Qc.Status = "Gagal masuk lagi ke " .. _Qp.world
                _bH("Auto Reconnect", _Qc.Status, 5)
                _cz.send("rejoin", _Qc.Status)
                _Qc.Busy = false
            end)
        end
        local _Qu = _n:FindFirstChild("WorldClosed")
        if _Qu and _Qu:IsA("RemoteEvent") then
            table.insert(_T, _Qu.OnClientEvent:Connect(function(_Qv)
                if _e() then
                    _Qn(_Qv)
                end
            end))
        end
        function _Qc.targetWorld()
            local _Qw = tostring(_Qc.Target or ""):upper():gsub("[^A-Z0-9]", "")
            if _Qw ~= "" then
                return _Qw
            end
            return _Qc.LastWorld or ""
        end
        local function _Qx(_Qy, _Qz, _QA)
            for _QB = 1, 3 do
                if not _e() then
                    return false
                end
                local _QC, _QD = _L.enterWorld(_Qy)
                if _QC then
                    task.wait(1.5)
                    if _Qz and _Qz.world == _Qy then
                        _Qk(_Qz, _QA)
                    else
                        _L.afterEnter()
                        _Qc.Count += 1
                        _Qc.Status = _QA .. " ke " .. _Qy .. " berhasil"
                        _cz.send("rejoin", _QA .. " ke " .. _Qy)
                    end
                    return true
                end
                _Qc.Status = ("Gagal masuk %s (%d/3): %s"):format(_Qy, _QB, tostring(_QD))
                task.wait(8)
            end
            _bH("Auto Rejoin", "Gagal masuk " .. _Qy, 5)
            _cz.send("rejoin", "Gagal masuk " .. _Qy)
            return false
        end
        function _Qc.now()
            if _Qc.Busy then
                _bH("Auto Rejoin", "Sedang proses masuk world, tunggu dulu", 3)
                return
            end
            local _QE = _Qc.targetWorld()
            if _QE == "" then
                _bH("Auto Rejoin", "World tujuan belum ada. Isi 'World tujuan' atau masuk world dulu", 4)
                return
            end
            _Qc.Busy = true
            task.spawn(function()
                local _QF = nil
                if _L.worldName() ~= "" then
                    if _L.anyRunning() then
                        _QF = _L.snapshot()
                    end
                    _L.stopAll()
                    _Qc.Status = "Keluar world..."
                    if not _L.leaveWorld() then
                        _Qc.Status = "Gagal keluar world"
                        _bH("Auto Rejoin", _Qc.Status, 4)
                        _Qc.Busy = false
                        return
                    end
                    task.wait(math.max(2, _Qc.DelaySec))
                end
                if _QF and _QF.world ~= _QE then
                    _QF = nil
                end
                _Qc.Status = "Masuk ke " .. _QE .. "..."
                _Qx(_QE, _QF, "Rejoin")
                _Qc.Busy = false
            end)
        end
        task.spawn(function()
            local _QG = nil
            while _e() do
                task.wait(2)
                local _QH = _L.worldName() == ""
                local _QI = _Qc.On and _Qc.Keep and not _Qc.Busy and not _Qc.Leaving and not _K.Traveling and _L.Mode == "idle"
                if not (_QH and _QI) then
                    _QG = nil
                else
                    _QG = _QG or os.clock()
                    local _QJ = _Qc.targetWorld()
                    if _QJ ~= "" and os.clock() - _QG >= _Qc.DelaySec then
                        _QG = nil
                        _Qc.Busy = true
                        local _QK = _Qc.Last
                        if _QK and (_QK.world ~= _QJ or os.clock() - _Qc.LastAt > 600) then
                            _QK = nil
                        end
                        _Qc.Status = "Di luar world, masuk ke " .. _QJ .. "..."
                        _Qx(_QJ, _QK, "Kembali otomatis")
                        _Qc.Busy = false
                    end
                end
            end
        end)
        local function _QL()
            local _QM = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
            local _QN = tostring(_Qc.ScriptUrl or "")
            if type(_QM) == "function" and string.sub(_QN, 1, 8) == "https://" then
                pcall(_QM, ("loadstring(game:HttpGet(%q))()"):format(_QN))
                return true
            end
            return false
        end
        local function _QO(_QP)
            if not (_Qc.On and _Qc.Server) or _Qc.Leaving then
                return
            end
            _Qc.Leaving = true
            local _QQ = _Qc.Last or (_L.anyRunning() and _L.snapshot()) or nil
            local _QR = _QQ and _QQ.world or _L.worldName()
            if _Qg and _QQ then
                local _QS = {
                    world = _QQ.world,
                    farm = _QQ.farm,
                    clear = _QQ.clear,
                    farmer = _QQ.farmer,
                    spam = _QQ.spam,
                    splice = _QQ.splice,
                    pabrik = _QQ.pabrik,
                    build = _QQ.build,
                    tx = _QQ.tx,
                    ty = _QQ.ty,
                    at = os.time(),
                }
                pcall(function()
                    writefile(_Qh, _Qd:JSONEncode(_QS))
                end)
            end
            local _QT = _QL()
            _Qc.Status = "Disconnect: rejoin..." .. (_QT and "" or " (script tidak di-queue)")
            _cz.send("rejoin", "Disconnect dari server (" .. tostring(_QP) .. "). Rejoin ke " .. (_QR ~= "" and _QR or "game"))
            task.spawn(function()
                task.wait(_Qc.DelaySec)
                while _e() do
                    pcall(function()
                        _Qe:Teleport(game.PlaceId, _k, (_QR ~= "") and {world = _QR} or nil)
                    end)
                    task.wait(15)
                end
            end)
        end
        pcall(function()
            table.insert(_T, _Qf.ErrorMessageChanged:Connect(function(_QU)
                if _e() and type(_QU) == "string" and _QU ~= "" then
                    _QO(_QU)
                end
            end))
        end)
        function _Qc.startup(_QV)
            if not _Qg then
                return
            end
            local _QW, _QX = pcall(isfile, _Qh)
            if not _QW or not _QX then
                return
            end
            local _QY, _QZ = pcall(readfile, _Qh)
            if type(delfile) == "function" then
                pcall(delfile, _Qh)
            end
            if not _QY or type(_QZ) ~= "string" then
                return
            end
            local _Ra, _Rb = pcall(_Qd.JSONDecode, _Qd, _QZ)
            if not _Ra or type(_Rb) ~= "table" or type(_Rb.world) ~= "string" or _Rb.world == "" then
                return
            end
            if os.time() - (tonumber(_Rb.at) or 0) > 15 * 60 then
                return
            end
            _Qc.Busy = true
            _Qc.Status = "Rejoin: menunggu masuk " .. _Rb.world
            local _Rc = os.clock()
            local _Rd = false
            while _e() and os.clock() - _Rc < 60 do
                if _P.World and _L.worldName() == _Rb.world and _kj.here() then
                    break
                end
                if not _P.World then
                    pcall(_QV)
                end
                if _P.World and not _Rd and os.clock() - _Rc > 12 then
                    _Rd = true
                    _L.enterWorld(_Rb.world)
                end
                task.wait(2)
            end
            if _e() and _L.worldName() == _Rb.world then
                pcall(_QV)
                task.wait(1)
                _Qk(_Rb, "Rejoin server")
            else
                _Qc.Status = "Rejoin: gagal masuk " .. _Rb.world
                _cz.send("rejoin", _Qc.Status)
            end
            _Qc.Busy = false
        end
    end)()
end
_bL.add("Reconnect", _Qc, {"On", "World", "Server", "DelaySec", "ScriptUrl", "Keep", "Target"})
_bL.add("Discord", _cz, {"On", "Url", "Penjaga", "Stop", "Full", "Bonus", "Rejoin", "Auto Rotasi", "ReportMin"})
local _Re = _ER("Koneksi", "plug", "setel")
_EI(function()
    _S.RefInfo = _Re:Paragraph({Title = "Referensi game", Desc = "-"})
end)
_Fe.ConnMain = _EY(_Re, "Koneksi", true)
_Fe.ConnCfg = _EY(_Re, "Config", true)
_Fe.ConnCalib = _EY(_Re, "Koreksi posisi", false)
_Fe.ConnLang = _EY(_Re, "Bahasa / Language", false)

local function _Rf(_Rg)
    if _F.Running then
        _kf("Dihentikan: hubungkan ulang ke game")
    end
    if _M.Running then
        _kg("Dihentikan: hubungkan ulang ke game")
    end
    _kj.resetReach()
    _dr()
    _gJ()
    _kj.findTreeRefs()
    table.clear(_R)
    _eQ()
    _eN(true)
    _Gt()
    if _D.LiteMode then
        _iq(true)
    end
    if _E.InfJump then
        _iB()
    end
    pcall(function()
        _S.RefInfo:SetDesc(_dL())
    end)
    _id()
    if _Rg then
        _bH(_Rg, _dL(), 5)
    end
end
_EI(function()
    _Fe.ConnMain:Button({
        Title = "Hubungkan ke game",
        Desc = "Pakai setelah pindah world",
        Callback = function()
            task.spawn(_Rf, "Koneksi")
        end,
    })
end)
_EI(function()
    _S.ConfigStatus = _Fe.ConnCfg:Paragraph({Title = "Status", Desc = _bL.Status})
end)
_EI(function()
    _Fe.ConnCfg:Toggle({
        Title = "Auto Save Config",
        Desc = "Simpan pengaturan otomatis, dimuat lagi saat execute",
        Value = _bL.AutoSave,
        Callback = function(_Rh)
            _bL.AutoSave = _Rh
            _bL.save(true)
        end,
    })
end)
_EI(function()
    _Fe.ConnCfg:Button({
        Title = "Simpan config sekarang",
        Callback = function()
            local _Ri = _bL.save(true)
            _bH("Config", _Ri and "Tersimpan" or _bL.Status, 3)
        end,
    })
end)
_EI(function()
    _Fe.ConnCfg:Button({
        Title = "Reset config (default)",
        Desc = "Hapus file config, lalu execute ulang",
        Callback = function()
            _bL.reset()
            _bH("Config", _bL.Status, 4)
        end,
    })
end)
_EI(function()
    _Fe.ConnLang:Dropdown({
        Title = "Bahasa / Language",
        Desc = "Ganti bahasa, lalu execute ulang",
        Values = {"Indonesia", "English"},
        Value = _W.Saved == "en" and "English" or "Indonesia",
        Callback = function(_Rj)
            local _Rk = (_Rj == "English") and "en" or "id"
            if _Rk == _W.Saved then
                return
            end
            _W.Saved = _Rk
            _bL.save(true)
            _bH("Bahasa / Language", "Execute ulang untuk ganti bahasa / Re-execute to apply", 5)
        end,
    })
end)
_EI(function()
    _Fe.ConnLang:Toggle({
        Title = "Tanya bahasa saat execute",
        Desc = "Munculkan pilihan bahasa tiap execute",
        Value = _W.Ask,
        Callback = function(_Rl)
            _W.Ask = _Rl
        end,
    })
end)
_EI(function()
    _Fe.ConnCalib:Input({
        Title = "Koreksi posisi X",
        Desc = "Isi 1 / -1 kalau tile meleset",
        Value = tostring(_D.CalibX),
        Callback = function(_Rm)
            _D.CalibX = tonumber(_Rm) or 0
        end,
    })
end)
_EI(function()
    _Fe.ConnCalib:Input({
        Title = "Koreksi posisi Y",
        Value = tostring(_D.CalibY),
        Callback = function(_Rn)
            _D.CalibY = tonumber(_Rn) or 0
        end,
    })
end) do
    (function()
        local _Ro = _EY(_Re, "Auto Reconnect", false)
        _EI(function()
            _S.RejoinStatus = _Ro:Paragraph({Title = "Status", Desc = _Qc.Status})
        end)
        _EI(function()
            _Ro:Toggle({
                Title = "Auto Reconnect",
                Desc = "Masuk lagi & lanjut aktivitas kalau terlempar",
                Value = _Qc.On,
                Callback = function(_Rp)
                    _Qc.On = _Rp
                end,
            })
        end)
        _EI(function()
            _Ro:Toggle({
                Title = "Terlempar dari world",
                Desc = "World ditutup / di-kick: masuk lagi ke world yang sama",
                Value = _Qc.World,
                Callback = function(_Rq)
                    _Qc.World = _Rq
                end,
            })
        end)
        _EI(function()
            _Ro:Toggle({
                Title = "Selalu kembali ke world",
                Desc = ("Kalau berada di luar world (layar pilih world), masuk lagi otoma" .. "tis"),
                Value = _Qc.Keep,
                Callback = function(_Rr)
                    _Qc.Keep = _Rr
                end,
            })
        end)
        _EI(function()
            _Ro:Input({
                Title = "World tujuan",
                Desc = "Kosongkan = world terakhir yang kamu masuki",
                Value = _Qc.Target,
                Placeholder = "NAMAWORLD",
                Callback = function(_Rs)
                    _Qc.Target = tostring(_Rs or "")
                end,
            })
        end)
        _EI(function()
            _Ro:Button({
                Title = "Rejoin world sekarang",
                Desc = "Keluar lalu masuk lagi, aktivitas dilanjutkan",
                Callback = function()
                    _Qc.now()
                end,
            })
        end)
        _EI(function()
            _Ro:Toggle({
                Title = "Disconnect dari server",
                Desc = "Teleport ulang ke game lalu masuk world terakhir",
                Value = _Qc.Server,
                Callback = function(_Rt)
                    _Qc.Server = _Rt
                end,
            })
        end)
        _Ff(_Ro, {
            Title = "Jeda sebelum masuk lagi (detik)",
            Min = 2,
            Max = 60,
            Step = 1,
            Default = _Qc.DelaySec,
            Callback = function(_Ru)
                _Qc.DelaySec = math.floor(_Ru)
            end,
        })
        _EI(function()
            _Ro:Input({
                Title = "URL script (untuk rejoin server)",
                Desc = ("Link raw script ini, supaya jalan lagi setelah teleport. Kosong " .. "= pakai autoexec"),
                Value = _Qc.ScriptUrl,
                Placeholder = "https://...",
                Callback = function(_Rv)
                    _Qc.ScriptUrl = tostring(_Rv or ""):gsub("^%s+", ""):gsub("%s+$", "")
                end,
            })
        end)
    end)()
end do
    (function()
        local _Rw = _ER("Discord", "bell", "setel")
        _EI(function()
            _S.HookStatus = _Rw:Paragraph({Title = "Status", Desc = _cz.Status})
        end)
        local _Rx = _EY(_Rw, "Webhook", true)
        local _Ry = _EY(_Rw, "Yang dikirim", false)
        _EI(function()
            _Rx:Toggle({
                Title = "Notifikasi Discord",
                Desc = "Kirim kabar penting ke channel Discord kamu",
                Value = _cz.On,
                Callback = function(_Rz)
                    _cz.On = _Rz
                end,
            })
        end)
        _EI(function()
            _Rx:Input({
                Title = "URL Webhook",
                Desc = "Channel Discord > Edit > Integrasi > Webhook > Salin URL",
                Value = _cz.Url,
                Placeholder = "https://discord.com/api/webhooks/...",
                Callback = function(_RA)
                    _RA = tostring(_RA or ""):gsub("^%s+", ""):gsub("%s+$", "")
                    _cz.Url = _RA
                    if _RA ~= "" and not _cz.valid(_RA) then
                        _bH("Discord", "URL webhook tidak valid", 4)
                    end
                end,
            })
        end)
        _EI(function()
            _Rx:Button({
                Title = "Tes kirim",
                Callback = function()
                    if not _cz.valid(_cz.Url) then
                        _bH("Discord", "Isi URL webhook dulu", 3)
                        return
                    end
                    local _RB = _cz.On
                    _cz.On = true
                    _cz.send("test", "Tes notifikasi dari Noxablox")
                    _cz.On = _RB
                    _bH("Discord", "Pesan tes masuk antrian", 3)
                end,
            })
        end)
        _Ff(_Rx, {
            Title = "Laporan statistik (menit)",
            Desc = "Kirim statistik sesi tiap X menit. 0 = mati",
            Min = 0,
            Max = 180,
            Step = 5,
            Default = _cz.ReportMin,
            Callback = function(_RC)
                _cz.ReportMin = math.floor(_RC)
            end,
        })
        for _RD, _RE in ipairs({
            {"Penjaga", "Mod / Dev / pemain masuk world"},
            {"Stop", "Aktivitas berhenti (block habis / error)"},
            {"Full", "Inventori penuh"},
            {"Bonus", "Quest diklaim / redeem berhasil"},
            {"Rejoin", "Terlempar / disconnect / masuk lagi"},
            {"Auto Rotasi", "Auto Rotasi drop seed / lahan selesai / berhenti"},
        }) do
            _EI(function()
                _Ry:Toggle({
                    Title = _RE[2],
                    Value = _cz[_RE[1]],
                    Callback = function(_RF)
                        _cz[_RE[1]] = _RF
                    end,
                })
            end)
        end
    end)()
end
task.spawn(function()
    _Rf("Noxablox v1.0")
    if _bL.saved("Penjaga", "On") == true and _e() then
        if _S.GuardToggle then
            pcall(function()
                _S.GuardToggle:Set(true)
            end)
        end
        if not _L.On then
            _L.set(true)
        end
    end
    _bL.start()
    _Qc.startup(_Rf)
end)
task.spawn(function()
    while _e() do
        if not _D.Running then
            _id()
        end
        _kj.updateClearStatus()
        _kj.updateFarmerStatus()
        _Cv()
        if _S.ConfigStatus and _bL.Status ~= _bL.Shown then
            _bL.Shown = _bL.Status
            pcall(function()
                _S.ConfigStatus:SetDesc(_bL.Status)
            end)
        end
        local _RG = ("%s\nWorld tujuan: %s\nBerhasil masuk lagi: %d kali"):format(_Qc.Status, (_Qc.targetWorld and _Qc.targetWorld() ~= "") and _Qc.targetWorld() or "-", _Qc.Count)
        if _S.RejoinStatus and _RG ~= _Qc.Shown then
            _Qc.Shown = _RG
            pcall(function()
                _S.RejoinStatus:SetDesc(_RG)
            end)
        end
        local _RH = ("%s\nAntrian: %d pesan"):format(_cz.Status, #_cz.Queue)
        if _S.HookStatus and _RH ~= _cz.Shown then
            _cz.Shown = _RH
            pcall(function()
                _S.HookStatus:SetDesc(_RH)
            end)
        end
        task.wait(1)
    end
end)
_d.Cleanup = function()
    _D.Running = false
    _F.Running = false
    _M.Running = false
    _O.On = false
    if _bL.AutoSave then
        pcall(_bL.save, false)
    end
    _L.On = false
    _IS.Quest, _IS.Redeem = false, false
    _JX.Auto = false
    _H.Running = false
    _Qc.On = false
    _K.Running = false
    _J.Running = false
    _D.Override = nil
    pcall(_kj.stopWalk)
    _N.active = false
    pcall(_kj.releaseInput)
    for _RI, _RJ in ipairs(_T) do
        pcall(function()
            _RJ:Disconnect()
        end)
    end
    _E.CustomName = false
    pcall(_De)
    pcall(_iq, false)
    pcall(_iE)
    if _iM and _w and rawget(_x, "isDown") == _iN then
        _x.isDown = _iM
    end
    if _P.World then
        if _E.Ghost then
            pcall(function()
                _P.World.ghost = false
            end)
        end
        if _E.Speed ~= 100 then
            pcall(function()
                _P.World.speedScale = 1
            end)
        end
    end
    pcall(function()
        _DA:Destroy()
    end)
    pcall(function()
        _Ep:Destroy()
    end)
    pcall(function()
        _EH:Destroy()
    end)
end
