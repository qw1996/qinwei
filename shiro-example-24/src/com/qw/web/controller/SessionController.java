package com.qw.web.controller;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import com.qw.session.RedisSessionDAO;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qw.Constants;



//在线会话管理controller

@RequiresPermissions("session:*")
@Controller
@RequestMapping("/sessions")
public class SessionController {
    @Autowired
    private RedisSessionDAO sessionDAO;
    @RequestMapping()
    public String list(Model model) {   //返回当前活跃的用户session列表
        Collection<Session> sessions =  sessionDAO.getActiveSessions();
        //将已经被强制退出的用户删除
        
        Collection<Session> sessions2 = new ArrayList<Session>();
        
        //根据session的属性PRINCIPALS_SESSION_KEY来判断session中是否存在未登录的session
        //(因为即使用户没有登录而处于登录页面，浏览器仍然会维持一个session且不为空，只是session未登录其中是不存在token)
        for(Session s:sessions){       	
        	if(s.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)!=null) {
        		sessions2.add(s);
        	}
        }
        
        
        model.addAttribute("sessions", sessions2);
        model.addAttribute("sessionCount", sessions2.size());
        return "sessions/list";
    }

    @RequestMapping("/{sessionId}/forceLogout")
    public String forceLogout(    //强制退出
            @PathVariable("sessionId") String sessionId, RedirectAttributes redirectAttributes) {
        try {
            Session session = sessionDAO.readSession(sessionId);
            if(session != null) {  //当前用户被强制退出
                session.setAttribute(Constants.SESSION_FORCE_LOGOUT_KEY, Boolean.TRUE);
                sessionDAO.delete(session);
            }
        } catch (Exception e) {/*ignore*/}
        redirectAttributes.addFlashAttribute("msg", "强制退出成功！");
        return "redirect:/sessions";
    }

}
