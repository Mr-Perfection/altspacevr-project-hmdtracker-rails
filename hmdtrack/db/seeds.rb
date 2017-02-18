Hmd.create([
  { name: "Rift DK1", company: "Oculus VR", state: "released",
    announced_at: DateTime.new(2012, 8, 1),
    image_url: "http://i.imgur.com/EY3KHSz.jpg" },
  { name: "Rift DK2", company: "Oculus VR", state: "released",
    announced_at: DateTime.new(2014, 3, 4),
    image_url: "http://i.imgur.com/awhOYii.jpg" },
  { name: "Rift CV1", company: "Oculus VR", state: "announced",
    announced_at: DateTime.new(2015, 5, 18),
    image_url: "http://i.imgur.com/Nw077of.jpg" },
  { name: "Gear VR Innovator Edition", company: "Oculus/Samsung", state: "released",
    announced_at: DateTime.new(2014, 9, 3),
    image_url: "http://i.imgur.com/K1kUWVc.png" },
  { name: "OSVR", company: "Razer", state: "devkit",
    announced_at: DateTime.new(2015, 1, 5),
    image_url: "http://i.imgur.com/QSo3WHu.jpg" },
  { name: "Vive", company: "Valve/HTC", state: "announced",
    announced_at: DateTime.new(2015, 3, 1),
    image_url: "http://i.imgur.com/fuvkUTB.jpg" },
  { name: "3D Head", company: "Anakando Media Group", state: "devkit",
    announced_at: DateTime.new(2015, 3, 1),
    image_url: "http://i.imgur.com/npqEWje.jpg" },
])

HmdState.create([
  {name: "announced"},
  {name: "devkit"},
  {name: "released"}])
