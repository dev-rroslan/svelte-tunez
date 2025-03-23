# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HeadsUp.Repo.insert!(%HeadsUp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tunez.Repo
alias Tunez.Accounts.User
import Ecto.Query
#alias Comeonin.Bcrypt # Ensure Bcrypt is installed for password hashing

unless Repo.exists?(from u in User, where: u.email == "dev.rroslan@gmail.com") do

# Define the admin user attributes
admin_user = %{
  email: "dev.rroslan@gmail.com",
  password: "rambling/ros",
  password_hash: Bcrypt.hash_pwd_salt("password"), # Replace with a secure password
  admin: true,
  confirmed_at: DateTime.utc_now() # Use utc_now for UTC timestamps
}

# Insert the admin user into the database
%User{}
|> User.registration_changeset(admin_user)
|> Repo.insert!()

end
