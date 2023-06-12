duelvala_sources = [
  'main.vala',
  'application.vala',
  'pages/window.vala',
  'pages/headerbar.vala',
  'pages/leaflet.vala',
  'pages/home.vala',
  'pages/retry.vala'
]

duelvala_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1', version: '>= 1.2'),
]

duelvala_sources += gnome.compile_resources('duelvala-resources',
  'duelvala.gresource.xml',
  c_name: 'duelvala'
)

executable('duelvala', duelvala_sources,
  dependencies: duelvala_deps,
       install: true,
)
