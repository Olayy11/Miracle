
When /^I post listing$/ do
  Capybara.current_driver = :httpclient_json
  Capybara.server = :webrick
  #
  #
 # page.driver.post('https://staging.outeast.com/api/realnet/listing/', { :params => { :degrees => "30" } })

  page.driver.post '/api/realnet/listing/', { "Content-Type:application/json" => "{
   'realnet_api_key':'security_token',
   'ptype':'home-for-rent',
   'meta_data':{
      'lastmod':'July, 23 2018 00:00:00',
      'firstadd':'May, 20 2013 00:00:00'
   },
   'listors':[
      {
         'company_name':'Georgiana B. Ketcham, Lic. RE Broker',
              'agent_id':10502,
         'last_name':'Mobius',
         'title':'',
              'first_name':'Paul',
         'mobile_phone':'631-553-4736',
         'email':'Paul@ketchamproperties.com',
              'office_name':'Georgiana B. Ketcham, Lic. RE Broker',
         'office_phone':'631-749-0800',
         'office_ext':''
      }
   ],
   'location_details':{
      'street_address':'1875 Oran-dhge',
      'town':'Noyack',
      'south_of_highway':false,
      'display_address':0
   },
   'listing_details':{
      'rent_status':'active',
      'acreage':6.0,
      'ad_copy':'This cozy one bedroom, one bathroom cottage with loft has a great view down a quiet creek.  The main floor features a covered porch with waterview, a living room with fireplace, a kitchen with adjoining dining area, the bathroom, the bedroom with adjoining sitting room and a separate laundry.  The sleeping loft is accessed by circular stairway.  Available for the summer season $22,000.',
      'full_baths':2.0,
      'sqft':500,
      'beds':2,
      'ad_title':'SHELTER ISLAND WATERFRONT COTTAGE-2018',
      'heat':'Other',
      'tennis':false,
      'water_orientation':'creekfront-canalfront',
      'pool':false,
      'listing_type':'open-listing',
      'house_style_1':'Cottage'
   },
   'id':141938,
   'open_houses':[

   ],
   'price_details':{
      'rental_price_details':{
          'jun':1000,
          'jul':1200
       }
   },
   'photos':[
   ]
}" }
  Capybara.current_driver = :chrome
end

