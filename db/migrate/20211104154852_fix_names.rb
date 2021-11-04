class FixNames < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.rename :user_id, :author_id
    end

    change_table :comments do |t|
      t.rename :user_id, :author_id
    end

    change_table :likes do |t|
      t.rename :user_id, :author_id
    end
  end
end
