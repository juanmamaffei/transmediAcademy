# README

## Instrucciones para el deploy

### Por primera vez

- Instalar rbenv y Ruby 3.0.0

- Instalar NodeJS 14 o 15

- Instalar Nginx y Passenger

- Instalar Postgres y crear base de dats

- Configuraciones

- Clonar repositorio


### Actualizaciones

```
bundle install
bundle exec rake assets:precompile RAILS_ENV=production
bundle exec rake assets:clean
bundle exec rake db:migrate RAILS_ENV=production
```

## Active Admin

Para crear el primer usuario de administración, desde la consola,

```
AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
```

Después, desde la GUI de Active Admin, *BORRAR EL USUARIO Y CREAR UNO NUEVO CON CREDENCIALES SEGURAS*.
