package database.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="jgy_user_conn_a")
public class UserConnA {

	@Id
	@Column(unique=true, nullable=false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserA user;
	@ManyToOne
	@JoinColumn(name = "like_user")
	private UserA likeUser;
	@Column(name = "add_time")
	private Date addTime;
	@Column(name = "status")
	private int status;
	@Column(name = "first")
	private int first;
	@Column(name = "meeting_date")
	private String meetingDate;
	@Column(name = "user_go")
	private int userGo;
	@Column(name = "like_go")
	private int likeGo;

	
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public UserA getUser() {
		return user;
	}
	public void setUser(UserA user) {
		this.user = user;
	}
	public UserA getLikeUser() {
		return likeUser;
	}
	public void setLikeUser(UserA likeUser) {
		this.likeUser = likeUser;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMeetingDate() {
		return meetingDate;
	}
	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}
	public int getUserGo() {
		return userGo;
	}
	public void setUserGo(int userGo) {
		this.userGo = userGo;
	}
	public int getLikeGo() {
		return likeGo;
	}
	public void setLikeGo(int likeGo) {
		this.likeGo = likeGo;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	
}
