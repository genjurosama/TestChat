if !@Schema
  @Schema = {}

@Schema.clientAudit = new SimpleSchema(
  "clientID":
    type: String
  "authorID":
    type: String
  "reportSource":
    type: String
  "reportDate":
    type: Date
  "creditScores":
    optional: true
    type: Object
  "creditScores.$":
    optional: true
    type: Object
    blackbox: true
  "numberOfInquiries":
    optional: true
    type: Object
  "numberOfInquiries.$":
    optional: true
    type: Object
    blackbox: true
  "personalInformation":
    optional: true
    type: Object
  "personalInformation.$":
    optional: true
    type: Object
    blackbox: true
  "creditGrades":
    optional: true
    type: Object
  "creditGrades.$":
    optional: true
    type: Object
    blackbox: true
)