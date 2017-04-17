import imp                                                    # deprecated.
# import importlib.util
from migrate.versioning import api
from app import db
from config import SQLALCHEMY_DATABASE_URI
from config import SQLALCHEMY_MIGRATE_REPO

migration = SQLALCHEMY_MIGRATE_REPO + '/versions/%03d_migration.py' % (api.db_version(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO) + 1)

tmp_module = imp.new_module('old_model')                      # deprecated.
# tmp_module = importlib.util.module_from_spec('old_module')

old_model = api.create_model(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO)

# exec old_model in tmp_module.__dict__                                         # python2 grammer.
exec(old_model, tmp_module.__dict__)

script = api.make_update_script_for_model(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO, tmp_module.meta, db.metadata)

open(migration, 'wt').write(script)

print('New migration saved as', migration)

print('Current database version:' + str(api.db_version(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO)))