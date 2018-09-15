class Ddl < ActiveRecord::Migration[5.2]
  def change
    drop_table( :messages, if_exists: true)
    drop_table( :site_images, if_exists: true)
    drop_table( :character_images, if_exists: true)
    drop_table( :review_images, if_exists: true)
    drop_table( :registered_genres, if_exists: true)
    drop_table( :used_characters, if_exists: true)
    drop_table( :access_count, if_exists: true)
    drop_table( :talks, if_exists: true)
    drop_table( :reviews, if_exists: true)
    drop_table( :genres, if_exists: true)
    drop_table( :characters, if_exists: true)
    drop_table( :categories, if_exists: true)

    create_table :categories do |t|
      t.string :name, :null => false

      t.timestamps
    end

    create_table :characters do |t|
      t.string :name, :null => false
      t.integer :age, :null => false
      t.datetime :birthday, :null => false
      t.text :like, :null => false
      t.text :dislike, :null => false
      t.text :text, :null => false

      t.timestamps
    end

    create_table :genres do |t|
      t.references :category
      t.string :name, :null => false

      t.timestamps
    end

    create_table :reviews do |t|
      t.references :category
      t.string :name, :null => false
      t.text :content, :null => false
      t.datetime :season, :null => false
      t.integer :score, :null => false
      t.datetime :posted_date, :null => false

      t.timestamps
    end

    create_table :talks do |t|
      t.references :category
      t.string :name, :null => false
      t.text :content, :null => false
      t.datetime :posted_date, :null => false

      t.timestamps
    end

    create_table :access_count do |t|
      t.references :review
      t.references :talk
      t.bigint :total_access_count
      t.bigint :monthly_access_count
      t.bigint :weekly_access_count
      t.bigint :daily_access_count
      t.datetime :posted_date, :null => false

      t.timestamps
    end

    create_table :used_characters, id: false do |t|
      t.references :review
      t.references :talk
      t.references :character

      t.timestamps
    end

    create_table :registered_genres do |t|
      t.references :review
      t.references :talk
      t.references :genre

      t.timestamps
    end

    create_table :review_images do |t|
      t.references :review
      t.integer :image_number, :null => false
      t.text :image_url, :null => false
      t.datetime :registered_date, :null => false
      t.boolean :title_image_flag, default: false, null: false

      t.timestamps
    end

    create_table :character_images do |t|
      t.references :character
      t.text :image_info, :null => false
      t.text :image_url, :null => false
      t.datetime :registered_date, :null => false

      t.timestamps
    end

    create_table :site_images do |t|
      t.text :image_info, :null => false
      t.text :image_url, :null => false
      t.datetime :registered_date, :null => false

      t.timestamps
    end

    create_table :messages do |t|
      t.string :sender_info, :null => false
      t.integer :classification, :null => false
      t.text :content, :null => false
      t.datetime :reception_date, :null => false

      t.timestamps
    end

    add_foreign_key :genres, :categories, column: :category_id
    add_foreign_key :reviews, :categories, column: :category_id
    add_foreign_key :talks, :categories, column: :category_id
    add_foreign_key :access_count, :reviews, column: :review_id
    add_foreign_key :access_count, :talks, column: :talk_id
    add_foreign_key :used_characters, :reviews, column: :review_id
    add_foreign_key :used_characters, :talks, column: :talk_id
    add_foreign_key :used_characters, :characters, column: :character_id
    add_foreign_key :registered_genres, :reviews, column: :review_id
    add_foreign_key :registered_genres, :talks, column: :talk_id
    add_foreign_key :registered_genres, :genres, column: :genre_id
    add_foreign_key :review_images, :reviews, column: :review_id
    add_foreign_key :character_images, :characters, column: :character_id
  end
end
