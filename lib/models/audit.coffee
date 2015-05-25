if !@Schema
  @Schema = {}

@Schema.clientAudit = new SimpleSchema(
  "clientID":
    type: String
  "authorID":
    type: String
  "reportSource":
    type: String
    autoform:
      type: "select"
      options: ()->
        data = colAdminSystem.findOne({name: "dropDowns"}).sources
        data.map (c)->
          return {label: c.reportSource, value: c.reportSource}
  "reportDate":
    type: Date
    optional: true
    autoform:
      afFieldInput:
        type: "bootstrap-datepicker"
        datePickerOptions:
          autoclose: true
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
  "conclusion":
    optional: true
    type: String
  "description":
    optional: true
    type: String

)