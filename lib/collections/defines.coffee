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