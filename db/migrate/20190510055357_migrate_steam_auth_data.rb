# frozen_string_literal: true

class MigrateSteamAuthData < ActiveRecord::Migration[5.2]
  def up
    execute <<~SQL
    INSERT INTO user_associated_accounts (
      provider_name,
      provider_uid,
      user_id,
      created_at,
      updated_at
    ) SELECT
      'steam',
      replace(key, 'steam_uid_', ''),
      (value::json->>'user_id')::integer,
      CURRENT_TIMESTAMP,
      CURRENT_TIMESTAMP
    FROM plugin_store_rows
    WHERE plugin_name = 'steam'
    SQL
  end
end
