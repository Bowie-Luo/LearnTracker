package com.example.learntracker.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class OperationLogAspect {
    
    @Around("@annotation(operationLog)")
    public Object around(ProceedingJoinPoint point, OperationLog operationLog) throws Throwable {
        long startTime = System.currentTimeMillis();
        String methodName = point.getSignature().getName();
        String className = point.getTarget().getClass().getSimpleName();
        
        log.info("[{}] {} started", className, methodName);
        
        Object result = point.proceed();
        
        long endTime = System.currentTimeMillis();
        log.info("[{}] {} completed, cost: {}ms", className, methodName, endTime - startTime);
        
        return result;
    }
}