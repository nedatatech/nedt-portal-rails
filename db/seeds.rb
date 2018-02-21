Company.create!([
  {name: "Namecheap", description: "Web Hosting."},
  {name: "New England Data Tech", description: "The best company in the world!"}
])
Customer.create!([
  {first_name: "Mike", last_name: "Kendall", email: "mkendall@whitecase.com", phone: "617-905-8206", street: "7 Holly Cir.", city: "Weston", state: "MA", zip: "02493", invoices_id: nil}
])
Employee.create!([
  {first_name: "Tim", last_name: "Monks", username: "poad27x", password_digest: "$2a$10$INEDBjxE57jhcOw/x.dRo.b7WjB2q2ry.MPzcTWkkEYe7gXdMtjEy", salt: "$2a$10$INEDBjxE57jhcOw/x.dRo.", email: "Poad27xx@gmail.com", phone: "978-433-6242", street: "10 Boynton St.", city: "Pepperell", state: "MA", zip: "01463", invoices_id: nil, owed: nil, payments_id: nil},
  {first_name: "Shawn", last_name: "Henrikson", username: "subarex84", password_digest: "$2a$10$uZEJ00UaxD.1BOiApm.M6e8CxnBBCSEAPvCAGjwGMFfyr95pret6y", salt: "$2a$10$uZEJ00UaxD.1BOiApm.M6e", email: "shawnhenrikson1@gmail.com", phone: "978-302-2556", street: "17 Plainfield Rd.", city: "Pepperell", state: "MA", zip: "01463", invoices_id: nil, owed: nil, payments_id: nil}
])
Status.create!([
  {name: "Scheduled", description: "Scheduled for a set date."},
  {name: "Completed", description: "Job has been completed."},
  {name: "In Progress", description: "Job is currently in progress"},
  {name: "Canceled", description: "The job was canceled. "},
  {name: "In communication", description: "In communication with the customer but job hasn't been scheduled or started yet."},
  {name: "Pending", description: "Transaction hasn't been completed yet."}
])
Type.create!([
  {name: "Credit Card", description: "Credit Card transaction."}
])
Job.create!([
  {invoice_id: nil, date: "2018-02-18", status_id: 1, scheduled_for: "2018-02-19 18:00:00", completed_on: "2018-02-19 13:04:00", customer_id: 1}
])
