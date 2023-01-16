/*
Query available at: https://app.flipsidecrypto.com/velocity/queries/0b989e76-50ab-484d-8a44-9570cd7b7357

Description:
  Adding some additional data points from the second set of 93 suspicious addresses for review.

*/

WITH 
  sturdy_deposits as (
  	SELECT 
  		event_inputs:onBehalfOf as user
  		, tx_hash as sturdy_deposit_tx_hash
  		, block_timestamp as sturdy_first_deposit_date
  		, row_number() over (partition by event_inputs:onBehalfOf order by block_number asc) as tx_order
  		
	FROM ethereum.core.fact_event_logs

  	WHERE 
  		contract_address in ('0xa422ca380bd70eef876292839222159e41aaee17') 
  		and event_name = 'Deposit'
  		AND tx_status = 'SUCCESS'
  		AND event_removed = false
		AND event_inputs:onBehalfOf IN ( 
  -- suspect addresses from https://github.com/sturdyfi/sturdy-airdrop-sybil/issues/15
            '0x2481fef92f6358a410f4b42a7672f23cac514c2a',
           '0xf8b9130c48bfc12a3df4a6bd2aad9511d32d83aa',
           '0xd7d97a98065f1bfe284ac869cc249f76c03326ea',
           '0x05699eb25a059e6db3610145e3a3f56526988847',
           '0x3c9052e1e1594902b4a7a43d58321dfc097a1719',
           '0xe05cdf159909179018c59cee21356246891ef692',
           '0x6c14cdc6b4b935614d2aa42635ed79b4617da0f5',
           '0xc9a5a7fda5f10f701e74902cade11b104fe30fbe',
           '0x93ea069784ba3580805ca976455201dff1cdc53f',
           '0x7a4c8e3655d665f3e25ccd6b60b1b024629b3705',
           '0x46671979c6188ebc1c795f6eae5ce209005f2dee',
           '0x96a85cd7e5d7a08f668054394f028290f57aceaa',
           '0x0388eaf12db6b8a977525d0ee0ec8f964f8aa9db',
           '0x1a62e6f3fd7574666b84efd59763e807988829f5',
           '0x87cab35e044b2e692341f4c6f767e4df58f38474',
           '0x9e73201903164d3b476505f3c54f86cdcd4010df',
           '0x94649845604d943cf105220045054f8bb3e3ce21',
           '0x90fe5af1d4c992718641bccdef1520e45e78d5c6',
           '0x135af87eff1d773e3aef90a7c1c971872b75452b',
           '0x74aa8463874aebb1ae29be8f8ba1adc322a9402d',
           '0xd27412131896b2defe03f66f4afce1e6d728d970',
           '0x2875403e0d69641cf631f10e48e63c40e4b27fc3',
           '0x2553206fed22408e29c607470d679528ee902eac',
           '0xb64057d1b26d50094c0439c21f787c5d605e83db',
           '0x52edb787c1473724f5d2b651229db1e2bd852b4a',
           '0x616b141299d0786fa25907b1f879d489263f95d3',
           '0xdaaa47da50c945bc97602cafe755cc2520ef2767',
           '0x58caa9f6f5ada966b6bebc5b3335ee9e41f2ed0c',
           '0x9f1995bf9dc4c2e19d7bec35cb7387a435e5495f',
           '0x98a97c80447bd8a5a84d487651728a98d26e85ef',
           '0x89c505b005d1ca6d1f5d8533f906e0f0d513a61a',
           '0x8d5dfe87469adc2069d6e0676a1351ed5827065c',
           '0xffebf6747d8b46852e552d0ffebe71d47ac9fcae',
           '0xd9bdbcf4c7e8bfc96686a4728c7873c4e20ab994',
           '0x51007ed400611829e137170db0cb6949b8191fb5',
           '0x99d305dfc38cefa91cb1129387681ede4c93e87d',
           '0x336a2941fb2882e3c40f4ce79d25068579b82c12',
           '0x2f14c570932ce6d4ce87d510e629c628a27f6c10',
           '0xae680ed83baf08a8028118bd19859f8a0e744cc6',
           '0x393d635b39f2351aefcf84cf5f8c755a038cb427',
           '0x831ae90da4ff946090992e98882ff16e79fbcfd6',
           '0x4df599c19ec1c904994115b2c23329a3ef2fb928',
           '0x1ec83f24f016e6b455002f15e5a6933e9f199fcd',
           '0x71f41fe15543f8e82e3268809b685481fbcab7b0',
           '0x1429bb62c3fc8cbfcbddf88e49e04bd93be00670',
           '0xc1e84835e43d72d2de3c0f0026e264e5714e0443',
           '0x0725d35e752c8801e014a0ac1f0bc2b7fdf571ca',
           '0xa56402fb07ece948941a04ca2ac8c3b28d28877e',
           '0x7609250783e636240b1b8d6ce53614a18b101be2',
           '0x5ff99d2712c61382c1483c61251a705051431850',
           '0x97339369814b53952eab6f3a8a37733a81df3257',
           '0xdacec2905604458e3208649682ab8d5f9f4a5edf',
           '0x69389398e4d903b02010e20d308ee58ea8d6d714',
           '0x7022f4cca0ab6632c6582c383635a58c10cd8206',
           '0x8b1af9cf98dc5e8ac3c24b4dfefe019b2d3f24cb',
           '0x5be4797e82a4826664c8431af4be44b82d212299',
           '0x76a5bc9eb03be30b552330ad6faf73da4e71909f',
           '0xa4ba02a9771d528496918c8d63c6b82bf14f7e2d',
           '0x8286acba2bc29a288ed0f7310c32d6b800a70907',
           '0xd59c44ecb7ac8ad708674871677465a4110a8cd7',
           '0x60cfc61488b167365c91cfca7e615a7bf1ed8194',
           '0xfbe6915fb22dfe6b42a7c50b43b45bf692681e5d',
           '0xb1f0b017a8a1cf913056bd813c3e1958045feca4',
           '0x37247eb611a592af4ca2d9f8d722810d13438f60',
           '0x9dae7a5b0ffd8c364d32136359fc91cd2a7cdc3b',
           '0x5840d518098a0790c18a5b4ef2aaf20275cab1a4',
           '0xcff1e58f8286a69ee09c25aa47f153f2d4c6f588',
           '0xc799b64934ce1afb866ea3cb17716cf5400e4593',
           '0x949ad06a4c904cd0b31ae2f56aae0ec68c16ccac',
           '0x85c49aca0abb871e5c876e6e5d5395bd88fa3f20',
           '0xa218d0ce0693c41a96f58667ba34f5f489e75628',
           '0x1501a306356a9ca71f66985dbff6d1978e2c2c79',
           '0x075030bbeed2cb50fd90b66051024f35054063a8',
           '0x0fe805304e49e993b2c59287000a2726330d2055',
           '0xac3c3c2c533619568bc34a331d3fb87121bf79ab',
           '0xda0a3c890603ae8248df00bdfecc49a94ce2dac2',
           '0xfadd0b6ae096c432fc4dc7fe0b93c959add05442',
           '0x585f9da4aaae242c4b72201dd31bdf6bfc2b4b97',
           '0x48bc6c71f73f171a5deee36c59f8c51542504060',
           '0x347bb83e4ab465c8c6b7afab3beb373410a9cae2',
           '0x33482803274c5e08661843636dcee8e9a68c7252',
           '0x9fd9bb687696f19038892989876bd6dc96abd769',
           '0x1537c0ee8ed1ed158145f898c2ddedacf2fc09b8',
           '0xafa626ecbaa3e1970c689a3cbe0530017fa4f2f4',
           '0x1cfaf69c935e66e94162545a2e66a33804c5a2ea',
           '0x8fd1afef6b9245fa3abb02899320d37a7a12427a',
           '0x66787a9aa595a75168018bc9137c9907dd54483b',
           '0x7d733f761559743f244766e402d0ea014c18d9fd',
           '0x1d88f5a58624688627fccd370dc8eac3a700c138',
           '0x0585c0d0aedf071a07992ad650bdc047cef0c04f',
           '0x15bd6e69f1f895ecc2f253156f76c6bd069f5e3f'
  	)
  )

SELECT 
  user, sturdy_deposit_tx_hash, sturdy_first_deposit_date, from_address as funding_address, first_seen_on_network
FROM 
  (
  	SELECT 
  		
    	tx.to_address
    	, tx.block_timestamp as first_seen_on_network
    	, sd.*
    	, tx.from_address
    	, row_number() over (partition by tx.to_address order by tx.block_timestamp asc) as tx_rank
    FROM ethereum.core.fact_transactions tx
      JOIN sturdy_deposits sd 
    	ON sd.user = tx.to_address
      	AND sd.tx_order = 1 
)

WHERE tx_rank = 1
