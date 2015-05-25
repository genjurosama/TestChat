@Schema.emailTemplate = new SimpleSchema(
  "uid":
    type:String
    optional:true
  "name":
    type: String
  "category":
    type: String
    allowedValues: ['Bureau', 'Collection Agency', 'Original Creditor','Government Office']
    autoform: {
      options: [
        {label: "Bureau", value: "Bureau"},
        {label: "Collection Agenvar atts = _.clone(this.atts);cy", value: "Collection Agency"},
        {label: "Original Creditor", value: "Original Creditor"},
        {label: "Government Office", value: "Government Office"}
      ]
    }
  "Templatetype":
    type: String
    label: "type"
    allowedValues: ['Fax', 'Letter', 'Email','Text Message']
    autoform: {
      options: [
        {label: "Fax", value: "Fax"},
        {label: "Letter", value: "Letter"},
        {label: "Email", value: "Email"},
        {label: "Text Message", value: "Text Message"}
      ]
    }
  "description":
    type: String
    autoform:
      afFieldInput:
        type: "textarea"
  "subject":
    type :String
    label:"Email Subject"
  "type":
    type:String
    optional:true
  "content":
    type: String
    label: "Froala Email"
    autoform: {
      type: "froalaEmail"
      afFieldInput: {
        froalaOptions: {
          customDropdowns: {
            customerVariables: {
              title: 'Customer Variables',
              icon: {
                type: 'font',
                value: 'fa fa-cart-plus',
              },
              options: {
                'Signature': ()-> this.insertHTML('[Customer First Name] [Customer Last Name]<br/>[Customer SSN]<br/>[Customer DOB]<br/>[Customer Address Line 1]<br/>[Customer Address Line 2]<br/>[Customer City], [Customer State]  [Customer Zip]');
                'First Name': ()-> this.insertHTML('[Customer First Name]');
                'Last Name': ()-> this.insertHTML('[Customer Last Name]');
              }
            }
          }
        } 
      }
    }
  "createdAt":
    type: Date
    autoValue: ()->
      if this.isInsert
        return moment().toDate()
)
colEmailTemplates.attachSchema(@Schema.emailTemplate)
colMyEmailTemplates.attachSchema(@Schema.emailTemplate)