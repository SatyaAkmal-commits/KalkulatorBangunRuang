class GeometryModel {
  String title;
  String formula;
  GeometryModel({required this.title, required this.formula});
}

List<GeometryModel> bangunRuang = [
  GeometryModel(title: "Kubus", formula: "Sisi x Sisi x Sisi"),
  GeometryModel(title: "Tabung", formula: "π x r² x t"),
  GeometryModel(title: "Kerucut", formula: "1/3 x π x r² x t"),
];
