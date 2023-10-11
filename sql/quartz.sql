-- ----------------------------
-- ��ʱ������ȱ�
-- ----------------------------
drop table if exists sys_job;
create table sys_job (
  job_id              bigint(20)    not null auto_increment    comment '����ID',
  job_name            varchar(64)   default ''                 comment '��������',
  job_group           varchar(64)   default 'DEFAULT'          comment '��������',
  invoke_target       varchar(500)  not null                   comment '����Ŀ���ַ���',
  cron_expression     varchar(255)  default ''                 comment 'cronִ�б��ʽ',
  misfire_policy      varchar(20)   default '3'                comment '�ƻ�ִ�д�����ԣ�1����ִ�� 2ִ��һ�� 3����ִ�У�',
  concurrent          char(1)       default '1'                comment '�Ƿ񲢷�ִ�У�0���� 1��ֹ��',
  status              char(1)       default '0'                comment '״̬��0���� 1��ͣ��',
  create_by           varchar(64)   default ''                 comment '������',
  create_time         datetime                                 comment '����ʱ��',
  update_by           varchar(64)   default ''                 comment '������',
  update_time         datetime                                 comment '����ʱ��',
  remark              varchar(500)  default ''                 comment '��ע��Ϣ',
  primary key (job_id, job_name, job_group)
) engine=innodb auto_increment=100 comment = '��ʱ������ȱ�';

insert into sys_job values(1, 'ϵͳĬ�ϣ��޲Σ�', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(2, 'ϵͳĬ�ϣ��вΣ�', 'DEFAULT', 'ryTask.ryParams(\'ry\')',  '0/15 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(3, 'ϵͳĬ�ϣ���Σ�', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- ��ʱ���������־��
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
  job_log_id          bigint(20)     not null auto_increment    comment '������־ID',
  job_name            varchar(64)    not null                   comment '��������',
  job_group           varchar(64)    not null                   comment '��������',
  invoke_target       varchar(500)   not null                   comment '����Ŀ���ַ���',
  job_message         varchar(500)                              comment '��־��Ϣ',
  status              char(1)        default '0'                comment 'ִ��״̬��0���� 1ʧ�ܣ�',
  exception_info      varchar(2000)  default ''                 comment '�쳣��Ϣ',
  create_time         datetime                                  comment '����ʱ��',
  primary key (job_log_id)
) engine=innodb comment = '��ʱ���������־��';
