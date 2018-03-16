package dao.springdao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FacultyModel;
import model.StudentModel;
import model.pollmodel.CreateNewPollModel;
import model.springmodel.ClassDiscussion;
import model.springmodel.ClassDiscussionComment;
import model.springmodel.ClassPosts;
import model.springmodel.Coordinator;
import model.springmodel.PollQueDetails;

@Repository
public class ClassDAOImpl implements ClassDAO {
	
	@Autowired
	private SessionFactory sessionFactory ;
	
	@Override
	public List<StudentModel> showClassMembers(StudentModel sm) 
	{
		Session currentSession= sessionFactory.getCurrentSession();
		
		Query<StudentModel> qr= currentSession.createQuery("from StudentModel where branch =:branch AND  semester =:semester"
														 + " AND section =:section",StudentModel.class);
		
		qr.setParameter("branch", sm.getBranch());
		qr.setParameter("semester", sm.getSemester());
		qr.setParameter("section", sm.getSection());
		
		List<StudentModel> classmembers =qr.getResultList();

		return classmembers;
	}

	@Override
	public List<StudentModel> showClassCR(StudentModel sm) 
	{	
		Session currentSession= sessionFactory.getCurrentSession();
		String id=sm.getBranch()+"-"+sm.getSemester()+"-"+sm.getSection()+"-"+sm.getBatch();
		
		Query<StudentModel> qr2= currentSession.createQuery("from StudentModel  where id IN("+
		"select id from ClassRepresentative where classid =:classid"+")",StudentModel.class);
		
		qr2.setParameter("classid", id);
		List<StudentModel> classCR =qr2.getResultList();
		 
		return classCR;
	}

	@Override
	public List<FacultyModel> showClassCoordinator(StudentModel sm) 
	{	
		Session currentSession= sessionFactory.getCurrentSession();
		String id=sm.getBranch()+"-"+sm.getSemester()+"-"+sm.getSection()+"-"+sm.getBatch();
		Query<FacultyModel> qr2= currentSession.createQuery("from FacultyModel  where id IN("+
		"select id from Coordinator where classid =:classid"+")",FacultyModel.class);
		
		qr2.setParameter("classid", id);
	    List<FacultyModel> classCoordinator =qr2.getResultList();
	    
		return classCoordinator;
	}

	@Override
	public List<PollQueDetails> showPoll(String classid) {
		
		Session currentSession= sessionFactory.getCurrentSession();
		
		Query qr= currentSession.createQuery("select postid from ClassPosts where classid =:id AND post_type='poll'");
		qr.setParameter("id", classid);
		
		List<Integer> queid= qr.list();
		
	    Iterator it = queid.iterator();
	    
	    while(it.hasNext())
	    {
	    	int pollqueid=(int) it.next();
	    	PollQueDetails pqd= currentSession.get(PollQueDetails.class,pollqueid);
	    	
	    }

		return null;
		
		
				
	}

	@Override
	public Boolean checkCoordinator(String fid)
	{	
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Coordinator> qr= currentSession.createQuery("from Coordinator where id=:id",Coordinator.class);
		qr.setParameter("id", fid);
		
		List<Coordinator> coordinator=qr.getResultList();
		
		if(coordinator.isEmpty()) 
		{
			return false;
		}
		else
		{
			return true;
		}
		
	}

	@Override
	public int addDiscussion(ClassDiscussion cd) 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		int id=(Integer)currentSession.save(cd);
		return id;
	}

	@Override
	public void addClassPost(ClassPosts cp) 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.save(cp);
	}

	@Override
	public List<ClassDiscussion> showDiscussions(String classId) 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query<ClassDiscussion> qr=currentSession.createQuery("from ClassDiscussion cd where cd.id in (select id from ClassPosts where classid =:classid and post_type='discussion')");
		qr.setParameter("classid", classId);
		List<ClassDiscussion> discussionList=qr.getResultList();
	
		return discussionList;
	}

	@Override
	public void postComment(ClassDiscussionComment cdc) 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		int commentId=(Integer)currentSession.save(cdc);
	}
	
	
				 
	}


