<?php

/**
 * BaseReviewer
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property integer $reviewId
 * @property integer $employeeNumber
 * @property integer $status
 * @property integer $reviewerGroupId
 * @property timestamp $completedDate
 * @property clob $comment
 * @property Doctrine_Collection $rating
 * @property ReviewerGroup $group
 * @property PerformanceReview $review
 * @property Employee $Employee
 * 
 * @method integer             getId()              Returns the current record's "id" value
 * @method integer             getReviewId()        Returns the current record's "reviewId" value
 * @method integer             getEmployeeNumber()  Returns the current record's "employeeNumber" value
 * @method integer             getStatus()          Returns the current record's "status" value
 * @method integer             getReviewerGroupId() Returns the current record's "reviewerGroupId" value
 * @method timestamp           getCompletedDate()   Returns the current record's "completedDate" value
 * @method clob                getComment()         Returns the current record's "comment" value
 * @method Doctrine_Collection getRating()          Returns the current record's "rating" collection
 * @method ReviewerGroup       getGroup()           Returns the current record's "group" value
 * @method PerformanceReview   getReview()          Returns the current record's "review" value
 * @method Employee            getEmployee()        Returns the current record's "Employee" value
 * @method Reviewer            setId()              Sets the current record's "id" value
 * @method Reviewer            setReviewId()        Sets the current record's "reviewId" value
 * @method Reviewer            setEmployeeNumber()  Sets the current record's "employeeNumber" value
 * @method Reviewer            setStatus()          Sets the current record's "status" value
 * @method Reviewer            setReviewerGroupId() Sets the current record's "reviewerGroupId" value
 * @method Reviewer            setCompletedDate()   Sets the current record's "completedDate" value
 * @method Reviewer            setComment()         Sets the current record's "comment" value
 * @method Reviewer            setRating()          Sets the current record's "rating" collection
 * @method Reviewer            setGroup()           Sets the current record's "group" value
 * @method Reviewer            setReview()          Sets the current record's "review" value
 * @method Reviewer            setEmployee()        Sets the current record's "Employee" value
 * 
 * @package    orangehrm
 * @subpackage model\performance\base
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseReviewer extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('ohrm_reviewer');
        $this->hasColumn('id', 'integer', 6, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'length' => 6,
             ));
        $this->hasColumn('review_id as reviewId', 'integer', 11, array(
             'type' => 'integer',
             'length' => 11,
             ));
        $this->hasColumn('employee_number as employeeNumber', 'integer', 11, array(
             'type' => 'integer',
             'length' => 11,
             ));
        $this->hasColumn('status as status', 'integer', 11, array(
             'type' => 'integer',
             'length' => 11,
             ));
        $this->hasColumn('reviewer_group_id as reviewerGroupId', 'integer', 11, array(
             'type' => 'integer',
             'length' => 11,
             ));
        $this->hasColumn('completed_date as completedDate', 'timestamp', 25, array(
             'type' => 'timestamp',
             'length' => 25,
             ));
        $this->hasColumn('comment as comment', 'clob', 65532, array(
             'type' => 'clob',
             'length' => 65532,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('ReviewerRating as rating', array(
             'local' => 'id',
             'foreign' => 'reviewer_id'));

        $this->hasOne('ReviewerGroup as group', array(
             'local' => 'reviewer_group_id',
             'foreign' => 'id'));

        $this->hasOne('PerformanceReview as review', array(
             'local' => 'review_id',
             'foreign' => 'id'));

        $this->hasOne('Employee', array(
             'local' => 'employee_number',
             'foreign' => 'emp_number'));
    }
}