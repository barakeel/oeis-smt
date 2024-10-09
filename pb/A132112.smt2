;; sequence(s): A132112
;; terms: 0 4 23 68 150 280 469 728 1068 1500 2035 2684 3458 4368 5425 6640 8024 9588 11343 13300
;; small program: (loop((y * y) + x, x + x, 0) + ((2 + x) * (x * x))) div 2
;; fast program: (2 * ((1 + x) * (x * x))) - ((((x * x) * x) - x) div (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ (v0 x) (* (+ 2 x) (* x x))) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* (+ 1 x) (* x x))) (divf (- (* (* x x) x) x) (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
