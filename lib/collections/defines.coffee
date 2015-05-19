@creditBureaus = {
  equifax:
    title: "Equifax"
    image: "/images/equifax_logo.png"
  experian:
    title: "Experian"
    image: "/images/experian_logo.png"
  transunion:
    title: "TransUnion"
    image: "/images/transunion_logo.png"
}

@itemTypes = {
  account: "Account"
  collection: "Collection"
  publicRecord: "Public Record"
  inquiry: "Inquiry"
  incorrectName: "Incorrect Name"
  incorrectSSN: "Incorrect SSN"
  incorrectDOB: "Incorrect DOB"
  incorrectAddress: "Incorrect Address"
}

@itemStatuses = {
  negative: {title: "Negative", color: "danger"}
  positive: {title: "Positive", color: "success"}
  repaired: {title: "Repaired", color: "success"}
  deleted: {title: "Deleted", color: "success"}
}

@auditTest = [
  {
    "label": "Is the client's name showing properly?"
    "key": "name"
    "type": "accuracy"
    "subLabel": "Client Name"
  },
  {
    "label": "Are there any misspellings?"
    "key": "misspelling"
    "type": "quantity"
    "subLabel": "How Many?"
  },
  {
    "label": "Are there any AKA's listed?"
    "key": "aka"
    "type": "quantity"
    "subLabel": "How Many?"
  },
  {
    "label": "Is the client's Year of Birth, listed on thier registration as [YOB], correct on all three bureaus?"
    "key": "yob"
    "type": "accuracy"
    "subLabel": "Year of Birth:"
  },
  {
    "label": "Is the client's Current Address [ADDRESS], correct on all three bureaus?"
    "key": "current_address"
    "type": "accuracy"
    "subLabel": "Current Address"
  },
  {
    "label": "Are there any Additional Addresses listed?"
    "key": "additional_address"
    "type": "quantity"
    "subLabel": "How Many?"
  }
]

