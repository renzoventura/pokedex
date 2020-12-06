class Problem {
  String errorMessage;

  Problem({
    this.errorMessage,
  });

  factory Problem.fromJson(Map<String, dynamic> json) =>
      Problem(errorMessage: json["errorMessage"]);

  Map<String, dynamic> toJson() => {"errorMessage": errorMessage};
}
