use [India Election Results]
-- How many total seats are available in the election?
	select 
	distinct count(parliament_constituency) as "Total Seats" 
	from constituencywise_results;

-- What are the total number of seats available for elections in each state?

	select 
	distinct s.State as "State Name",count(*) as "Total Seats" from constituencywise_results c
	inner join statewise_results sr on c.Parliament_Constituency=sr.Parliament_Constituency
	inner join states s on sr.State_ID=s.State_ID
	group by s.State;

-- Total Seats Won by NDA Alliance
	
	select 
		SUM(case
				when party IN(
					'Bharatiya Janata Party - BJP',
					'Telugu Desam - TDP',
					'Janata Dal  (United) - JD(U)',
					'Shiv Sena - SHS',
					'AJSU Party - AJSUP',
					'Apna Dal (Soneylal) - ADAL',
					'Asom Gana Parishad - AGP',
					'Hindustani Awam Morcha (Secular) - HAMS',
					'Janasena Party - JnP',
					'Janata Dal  (Secular) - JD(S)',
					'Lok Janshakti Party(Ram Vilas) - LJPRV',
					'Nationalist Congress Party - NCP',
					'Rashtriya Lok Dal - RLD',
					'Sikkim Krantikari Morcha - SKM'
				) THEN [Won]
				ELSE 0 
			END) as "NDA Total Seats Won"	
		from 
			partywise_results;


-- Seats Won by NDA Alliance Parties.

		select 
			party as party_name,
			won as Seats_won
		from 
			partywise_results
				where party IN(
					'Bharatiya Janata Party - BJP',
					'Telugu Desam - TDP',
					'Janata Dal  (United) - JD(U)',
					'Shiv Sena - SHS',
					'AJSU Party - AJSUP',
					'Apna Dal (Soneylal) - ADAL',
					'Asom Gana Parishad - AGP',
					'Hindustani Awam Morcha (Secular) - HAMS',
					'Janasena Party - JnP',
					'Janata Dal  (Secular) - JD(S)',
					'Lok Janshakti Party(Ram Vilas) - LJPRV',
					'Nationalist Congress Party - NCP',
					'Rashtriya Lok Dal - RLD',
					'Sikkim Krantikari Morcha - SKM'
				) 
		order by seats_won DESC;

-- Total Seats Won by I.N.D.I.A. Alliance. 

	SELECT 
		SUM(CASE 
				WHEN party IN (
					'Indian National Congress - INC',
					'Aam Aadmi Party - AAAP',
					'All India Trinamool Congress - AITC',
					'Bharat Adivasi Party - BHRTADVSIP',
					'Communist Party of India  (Marxist) - CPI(M)',
					'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
					'Communist Party of India - CPI',
					'Dravida Munnetra Kazhagam - DMK',
					'Indian Union Muslim League - IUML',
					'Nat`Jammu & Kashmir National Conference - JKN',
					'Jharkhand Mukti Morcha - JMM',
					'Jammu & Kashmir National Conference - JKN',
					'Kerala Congress - KEC',
					'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
					'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
					'Rashtriya Janata Dal - RJD',
					'Rashtriya Loktantrik Party - RLTP',
					'Revolutionary Socialist Party - RSP',
					'Samajwadi Party - SP',
					'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
					'Viduthalai Chiruthaigal Katchi - VCK'
				) THEN [Won]
				ELSE 0 
			END) AS INDIA_Total_Seats_Won
	FROM 
		partywise_results;

-- Seats Won by I.N.D.I.A. Alliance Parties.	
	
	SELECT 
		party as party_name,
		won as Seats_won 
		from partywise_results
				WHERE party IN (
					'Indian National Congress - INC',
					'Aam Aadmi Party - AAAP',
					'All India Trinamool Congress - AITC',
					'Bharat Adivasi Party - BHRTADVSIP',
					'Communist Party of India  (Marxist) - CPI(M)',
					'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
					'Communist Party of India - CPI',
					'Dravida Munnetra Kazhagam - DMK',
					'Indian Union Muslim League - IUML',
					'Nat`Jammu & Kashmir National Conference - JKN',
					'Jharkhand Mukti Morcha - JMM',
					'Jammu & Kashmir National Conference - JKN',
					'Kerala Congress - KEC',
					'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
					'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
					'Rashtriya Janata Dal - RJD',
					'Rashtriya Loktantrik Party - RLTP',
					'Revolutionary Socialist Party - RSP',
					'Samajwadi Party - SP',
					'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
					'Viduthalai Chiruthaigal Katchi - VCK'
				) 
	 ORDER BY Seats_won DESC;

-- Add new column field in table partywise_results to get the party Alliance as NDA,I.N.D.I.A. and Other.
	ALTER TABLE partywise_results
	add "Party Alliance" varchar(50)

	-- For I.N.D.I.A. Alliance 
	UPDATE partywise_results
	SET "Party Alliance" = 'I.N.D.I.A'
	WHERE party IN (
		'Indian National Congress - INC',
		'Aam Aadmi Party - AAAP',
		'All India Trinamool Congress - AITC',
		'Bharat Adivasi Party - BHRTADVSIP',
		'Communist Party of India  (Marxist) - CPI(M)',
		'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
		'Communist Party of India - CPI',
		'Dravida Munnetra Kazhagam - DMK',	
		'Indian Union Muslim League - IUML',
		'Jammu & Kashmir National Conference - JKN',
		'Jharkhand Mukti Morcha - JMM',
		'Kerala Congress - KEC',
		'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
		'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
		'Rashtriya Janata Dal - RJD',
		'Rashtriya Loktantrik Party - RLTP',
		'Revolutionary Socialist Party - RSP',
		'Samajwadi Party - SP',
		'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
		'Viduthalai Chiruthaigal Katchi - VCK'
   );
   -- For NDA Alliance
   UPDATE partywise_results
   SET "Party Alliance" = 'NDA'
   WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
   );

   -- For Other
   Update partywise_results
   SET "Party Alliance"='Other'
   where "Party Alliance" is NULL;

   select "Party Alliance",
   sum(Won)
   from partywise_results
   group by "Party Alliance";


-- Winning candidate's name, theie party name, total votes, and the margin of victory for a specific state and constituency.
	SELECT 
	cr.winning_candidate,
	pr.party,
	cr.total_votes,
	cr.margin,
	s.state,
	cr.constituency_name
	from constituencywise_results cr 
	inner join partywise_results pr on cr.Party_ID=pr.Party_ID
	inner join statewise_results sr on cr.parliament_constituency=sr.Parliament_Constituency
	inner join states s on sr.State_ID=s.State_ID
	where cr.constituency_name like 'NASHIK';

-- What is the distribution of EVM votes vs postal votes for candidates in a specific constituency.
	SELECT 
	cd.EVM_Votes,
	cd.Postal_Votes,
	cd.Total_Votes,
	cd.candidate,
	cr.constituency_name
	from constituencywise_results cr join constituencywise_details cd
	on cr.Constituency_ID = cd.Constituency_ID
	where cr.Constituency_Name='AKOLA';


-- Which parties won the most seates in a State, and how many seats each party win.
	SELECT 
    p.Party,
    COUNT(cr.Constituency_ID) AS Seats_Won
	FROM constituencywise_results cr
	JOIN partywise_results p ON cr.Party_ID = p.Party_ID
	JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
	JOIN states s ON sr.State_ID = s.State_ID
	WHERE s.state = 'Maharashtra'
	GROUP BY p.Party
	ORDER BY Seats_Won DESC; 

-- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A. and Other)
-- each state for the India Elections 2024.
	SELECT 
	s.state,
	sum(case when p."Party Alliance" = 'NDA' then 1 else 0 end) as NDA_Seats_Won,
	sum(case when p."Party Alliance" = 'I.N.D.I.A' then 1 else 0 end) as INDIA_Seats_Won,
	sum(case when p."Party Alliance" = 'Other' then 1 else 0 end) as Other_Seats_Won
	FROM constituencywise_results cr
	JOIN partywise_results p ON cr.Party_ID = p.Party_ID
	JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
	JOIN states s ON sr.State_ID = s.State_ID
	WHERE s.state = 'Maharashtra'
	Group by s.state
	
-- Which candidate received the highest number of EVM votes in each constituency(TOP 10)?

	SELECT TOP 10 
	cr.Constituency_Name,
	cd.Constituency_ID,
	cd.Candidate,
	cd.EVM_Votes
	from constituencywise_results cr
	inner join constituencywise_details cd on cr.Constituency_ID=cd.Constituency_ID
	where cd.EVM_Votes = (
		select MAX(cd1.EVM_Votes)
		from constituencywise_details cd1 
		where cd1.Constituency_ID=cd.Constituency_ID
		)
		ORDER BY
			cd.EVM_Votes DESC;

-- Which candidate won and which candidate was the runner-up in each constituency of state for the 2024 elections?

	WITH RankedCandidates AS (
		SELECT 
			cd.Constituency_ID,
			cd.Candidate,
			cd.Party,
			cd.EVM_Votes,
			cd.Postal_Votes,
			cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
			ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
		FROM 
			constituencywise_details cd
		JOIN 
			constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
		JOIN 
			statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
		JOIN 
			states s ON sr.State_ID = s.State_ID
		WHERE 
			s.State = 'Maharashtra'
	)

	SELECT 
		cr.Constituency_Name,
		MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
		MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
	FROM 
		RankedCandidates rc
	JOIN 
		constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
	GROUP BY 
		cr.Constituency_Name
	ORDER BY 
		cr.Constituency_Name;


-- For the state of Maharashtra, what are the total number of seats, total number of candidates,
-- total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?
	SELECT 
		COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
		COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
		COUNT(DISTINCT p.Party) AS Total_Parties,
		SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
		SUM(cd.EVM_Votes) AS Total_EVM_Votes,
		SUM(cd.Postal_Votes) AS Total_Postal_Votes
	FROM constituencywise_results cr
	JOIN constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
	JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
	JOIN states s ON sr.State_ID = s.State_ID
	JOIN partywise_results p ON cr.Party_ID = p.Party_ID
	WHERE s.State = 'Maharashtra';


	