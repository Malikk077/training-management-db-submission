select batch_id,candidate_status
from candidate_batch
where candidate_id in (
select candidate_id 
from candidates 
where candidate_name like "tom%");


select trainer_name
from trainers
where trainer_id in (
select trainer_id from batch_trainers
where batch_id=3);

select * 
from topic 
where course_id=3;

select candidate_id,score
from submissions
where candidate_id in (
select candidate_id
from candidate_batch
where batch_id=3);

select candidates.candidate_name 
from candidates
join candidate_batch on candidates.candidate_id=candidate_batch.candidate_id
where candidate_batch.batch_id=3 and candidate_batch.candidate_status='completed';

