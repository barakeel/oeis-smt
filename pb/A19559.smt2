;; sequence(s): A19559
;; terms: 4 4 6 6 6 4 4 6 6 6 4 4 6 6 6 4 4 6 6 6
;; small program: ((2 mod (1 + (x mod (1 + (2 + 2))))) + 2) + 2
;; fast program: 2 + loop(2, 2 - (x mod (1 + (2 + 2))), 2 + 2)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (modf 2 (+ 1 (modf x (+ 1 (+ 2 2))))) 2) 2))))
(assert (= f0 2))
(assert (forall ((x Int)) (= (g0 x) (- 2 (modf x (+ 1 (+ 2 2)))))))
(assert (= h0 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (v0 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
