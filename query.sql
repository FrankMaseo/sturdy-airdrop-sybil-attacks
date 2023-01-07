// queried on flipside crypto
// Query URL: https://app.flipsidecrypto.com/velocity/queries/31cecc7a-9953-4c0f-bc1a-1f6add1f7f15

WITH 
  sturdy_deposits as (
  	SELECT 
  		event_inputs:onBehalfOf as user
  		, min(block_timestamp) as first_deposit_date
  		, count(distinct tx_hash) as no_deposits
  		

	FROM ethereum.core.fact_event_logs

  	WHERE 
  		contract_address in ('0xa422ca380bd70eef876292839222159e41aaee17') 
  		and event_name = 'Deposit'
  		AND tx_status = 'SUCCESS'
  		AND event_removed = false
  	GROUP BY 1
  )

SELECT 
  *
FROM 
  (
  	SELECT 
  	
	sd.user
  	, tx.to_address
  	, tx.block_timestamp as first_seen_on_network
  	, sd.first_deposit_date
  	, sd.no_deposits
  	, tx.from_address
  	, row_number() over (partition by tx.to_address order by tx.block_timestamp asc) as tx_rank
  	
FROM ethereum.core.fact_transactions tx
  JOIN sturdy_deposits sd 
	ON sd.user = tx.to_address
)

WHERE tx_rank = 1
