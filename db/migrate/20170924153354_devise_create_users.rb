class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # 2019.09.25
      # soomti add
      # 사용자의 휴대폰 번호를 담는다.
      t.string :phone_number
      # 사용자의 이름을 담는다. 
      t.string :user_name

      # 사용자의 권한을 담는다.

      # 0 -> 휴대폰 번호를 추가로 입력하지 않은 사용자. 
      # 1 -> 휴대폰 번호를 추가로 입력한 사용자. 
      # 3 -> 휴대폰 번호를 다 입력한 스터디룸 주인
      # 9 -> 웹 개발 관리자

      # 0 일 경우에는, 사용자 시큐리티 설정. 권한을 입력하는 값을 넣는다.
      t.string :user_level, default: 0
      
      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
