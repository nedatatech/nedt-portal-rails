Company.create!([
  {name: "New England Data Tech", description: "The best company in the world!"},
  {name: "Namecheap", description: "Web Services."}
])
CompanyTask.create!([
  {company_id: 1, task_type_id: 1, description: "Save the world!", status_id: 2}
])
Employee.create!([
  {first_name: "Tim", last_name: "Monks", username: "poad27x", password_digest: "$2a$10$P2I54gXLS54lf8lKPgVc7O9Je.WaKhm3b2zpXAOJ3UCHJbrg7GdBy", salt: "$2a$10$P2I54gXLS54lf8lKPgVc7O", email: "Poad27xx@gmail.com", phone: "978-433-6242", street: "10 Boynton st.", city: "Pepperell", state: "MA", zip: "01463", invoices_id: nil, owed: nil, payments_id: nil},
  {first_name: "Shawn", last_name: "Henrikson", username: "subarex84", password_digest: "$2a$10$uZEJ00UaxD.1BOiApm.M6e8CxnBBCSEAPvCAGjwGMFfyr95pret6y", salt: "$2a$10$uZEJ00UaxD.1BOiApm.M6e", email: "shawnhenrikson1@gmail.com", phone: "978-302-2556", street: "17 Plainfield Rd.", city: "Pepperell", state: "MA", zip: "01463", invoices_id: nil, owed: nil, payments_id: nil}
])
EmployeeTask.create!([
  {employee_id: 1, task_type_id: 1, description: "Do something.", status_id: 2},
  {employee_id: 2, task_type_id: 2, description: "Do the rest.", status_id: 2}
])
Status.create!([
  {name: "Completed", description: "Item has been completed."},
  {name: "In Progress", description: "Item is currently in progress."}
])
TaskType.create!([
  {name: "E-mail", description: "E-mail related task."},
  {name: "Follow up", description: "Follow up on task."}
])
