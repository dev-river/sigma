package kr.co.controller;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {
	@Inject
	private DataSource ds;
	
	@Test
	public void testDataSource() {
		System.out.println(ds + "-----------------------");
		
		Connection conn = null;
		try {
			conn = ds.getConnection();
			System.out.println(conn + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
