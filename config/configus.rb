Configus.build Rails.env do
   env :production do
     omniauth do
       #facebook do
       #  id '206776466167295'
       #  secret 'ecea3e0db6c4c2c67a3e0c48c2c9226c'
       #end
       vkontakte do
         id '3947350'
         secret 'gybvTblVA9ehWxqE0xec'
       end
     end
   end

   env :development, :parent => :production do
     omniauth do
       facebook do
         id '240317939458898'
         secret '08222d897cbbe670f3a5397fb15c099f'
       end
     end
   end

   env :test, :parent => :development do
   end
end
