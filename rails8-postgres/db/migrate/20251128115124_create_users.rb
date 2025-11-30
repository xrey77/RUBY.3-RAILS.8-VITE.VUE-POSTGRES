class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :firstname, null: true
      t.string :lastname, null: true
      t.string :email, null: false, index: { unique: true}
      t.string :mobile, null: true
      t.string :username, null: false, index: { unique: true}
      t.string :password_digest
      t.string :roles, default: 'ROLE_USER', null: false
      t.string :userpic, default: 'http://127.0.0.1:3000/images/pix.png', null: false
      t.integer :isactivated, default: 1
      t.integer :isblocked, default: 0
      t.text :secret, null: true
      t.text :qrcodeurl, null: true
      t.integer :mailtoken, default: 0

      t.timestamps
    end
  end
end
